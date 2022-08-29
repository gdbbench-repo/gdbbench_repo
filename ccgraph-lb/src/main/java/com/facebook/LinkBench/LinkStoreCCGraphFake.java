package com.facebook.LinkBench;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import java.util.Properties;
import java.io.IOException;

import com.ccgraph.ccgraph.Measurement;
import com.facebook.LinkBench.measurements.Measurements;
import com.facebook.LinkBench.measurements.OneMeasurementTrace;

/**
 * A simple client that requests a greeting from the {@link HelloWorldServer}.
 */
public class LinkStoreCCGraphFake extends GraphStore {
  private static final Logger logger = Logger.getLogger(LinkStoreCCGraphFake.class.getName());


  private static boolean _dbidready = false;
  private static String _dbid = "";
  private Measurements _measurements = Measurements.getMeasurements();

  private int threadId;


  private String ccgraph_aliGetFan_txnname;
  private String ccgraph_aliGetFollow_txnname;
  private String ccgraph_aliRecom_txnname;
  private String ccgraph_aliFollow_txnname;
  private String ccgraph_aliUnfollow_txnname;
  private String ccgraph_aliLogin_txnname;
  private String ccgraph_aliReg_txnname;
  private String ccgraph_aliRegRef_txnname;
  private String ccgraph_aliPay_txnname;

  private String ccgraph_aliLoginSimple_txnname;
  private String ccgraph_aliRegSimple_txnname;
  private String ccgraph_aliRegRefSimple_txnname;
  private String ccgraph_aliFilter_txnname;

  private String ccgraph_mix_login_txnname;
  private String ccgraph_mix_reg_txnname;
  private String ccgraph_mix_reg_ref_txnname;
  private String ccgraph_mix_filter_txnname;
  private String ccgraph_mix_pay_txnname;
  private String ccgraph_mix_one_hop_txnname;
  private String ccgraph_mix_recom_txnname;
  private String ccgraph_mix_like_txnname;
  private String ccgraph_mix_dislike_txnname;
  
  public void initialize(Properties p,
      Phase currentPhase, int threadId) throws IOException, Exception {
    this.threadId = threadId;

    ccgraph_aliGetFan_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.aliGetFan");
    ccgraph_aliGetFollow_txnname = ConfigUtil.getPropertyRequired(p, "ccgraph.aliGetFollow");
    ccgraph_aliRecom_txnname     = ConfigUtil.getPropertyRequired(p, "ccgraph.aliRecom");
    ccgraph_aliFollow_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.aliFollow");
    ccgraph_aliUnfollow_txnname  = ConfigUtil.getPropertyRequired(p, "ccgraph.aliUnfollow");
    ccgraph_aliLogin_txnname     = ConfigUtil.getPropertyRequired(p, "ccgraph.aliLogin");
    ccgraph_aliReg_txnname       = ConfigUtil.getPropertyRequired(p, "ccgraph.aliReg");
    ccgraph_aliRegRef_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.aliRegRef");
    ccgraph_aliPay_txnname       = ConfigUtil.getPropertyRequired(p, "ccgraph.aliPay");

    ccgraph_aliLoginSimple_txnname  = ConfigUtil.getPropertyRequired(p, "ccgraph.aliLoginSimple");
    ccgraph_aliRegSimple_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.aliRegSimple");
    ccgraph_aliRegRefSimple_txnname = ConfigUtil.getPropertyRequired(p, "ccgraph.aliRegRefSimple");
    ccgraph_aliFilter_txnname       = ConfigUtil.getPropertyRequired(p, "ccgraph.aliFilter");

    ccgraph_mix_login_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.mixLogin");
    ccgraph_mix_reg_txnname      = ConfigUtil.getPropertyRequired(p, "ccgraph.mixReg");
    ccgraph_mix_reg_ref_txnname  = ConfigUtil.getPropertyRequired(p, "ccgraph.mixRegRef");
    ccgraph_mix_filter_txnname   = ConfigUtil.getPropertyRequired(p, "ccgraph.mixFilter");
    ccgraph_mix_pay_txnname      = ConfigUtil.getPropertyRequired(p, "ccgraph.mixPay");
    ccgraph_mix_one_hop_txnname  = ConfigUtil.getPropertyRequired(p, "ccgraph.mixOneHop");
    ccgraph_mix_recom_txnname    = ConfigUtil.getPropertyRequired(p, "ccgraph.mixRecom");
    ccgraph_mix_like_txnname     = ConfigUtil.getPropertyRequired(p, "ccgraph.mixLike");
    ccgraph_mix_dislike_txnname  = ConfigUtil.getPropertyRequired(p, "ccgraph.mixDislike");


    OneMeasurementTrace.setSerializer(new OneMeasurementTrace.ObjSerializer(){
      @Override
      public String str(Object obj) {
        return (String) obj;
      }
    });
  }
  /**
   * Do any cleanup.  After this is called, store won't be reused
   */
  public void close() {
  }

  // this is invoked when an error happens in case connection needs to be
  // cleaned up, reset, reopened, whatever
  public void clearErrors(int threadID) {}

  @Override
  public void resetNodeStore(String dbid, long startID) throws Exception {
    System.err.println("reset node store is not implemented");
    // System.exit(1);
  }

  public void shutdown() throws InterruptedException {}

  private void checkDBID(String dbid) {
    if (_dbidready == false) {
      synchronized(LinkStoreCCGraphFake.class) {
        if (_dbidready == false) {
          _dbid = dbid;
          _dbidready = true;
        }
      }
    }
    if (_dbid != dbid) {
      System.exit(1);
    }
  }


  private void addMeasure(Object obj) {
    _measurements.measureTrace("operation", threadId, obj);
  }

  public boolean aliUpdateNode(String dbid, Node node) throws Exception {
    checkDBID(dbid);
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("ali_login");
    rqst.addParam(node.id);

    addMeasure(rqst.toString());

    return true;
  }

  // for benching
  @Override
  public int RecurUpdate(long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.recur_update");
    rqst.addParam(m_id);
    addMeasure(rqst.toString());
    return 0;
  }
  @Override
  public boolean OneHopScan(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.one_hop_scan");
    rqst.addParam(p_id);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public boolean TwoHopScan(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.two_hop_scan");
    rqst.addParam(p_id);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public boolean UpsertLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.upsert_like");
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public boolean DeleteLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.delete_like");
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    addMeasure(rqst.toString());
    return true;
  }
  @Override 
  public boolean UpdateMsg(long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.update_node");
    rqst.addParam(m_id);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public UserNode[] aliGetFan(long id, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliGetFan_txnname);
    rqst.addParam(id);
    rqst.addParam(offset);
    rqst.addParam(limit);
    addMeasure(rqst.toString());
    return new UserNode[0];
  }

  @Override
  public UserNode[] aliGetFollow(long id, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliGetFollow_txnname);
    rqst.addParam(id);
    rqst.addParam(offset);
    rqst.addParam(limit);
    addMeasure(rqst.toString());
    return new UserNode[0];
  }

  @Override
  public UserNode[] aliRecom(long id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliRecom_txnname);
    rqst.addParam(id);
    addMeasure(rqst.toString());
    return new UserNode[0];
  }
  @Override
  public boolean aliFollow(LinkFollow l) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliFollow_txnname);
    rqst.addParam(l.id1);
    rqst.addParam(l.id2);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public boolean aliUnfollow(long id1, long id2) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliUnfollow_txnname);
    rqst.addParam(id1);
    rqst.addParam(id2);
    addMeasure(rqst.toString());
    return true;
  }
  @Override
  public long aliLogin(long id, byte[] macAddr, byte[] ipAddr, long timestamp) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliLogin_txnname);
    rqst.addParam(id);
    addMeasure(rqst.toString());
    return 1;
  }
  @Override
  public boolean aliPay(long id1, long id2, long amount) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliPay_txnname);
    rqst.addParam(id1);
    rqst.addParam(id2);
    rqst.addParam(amount);
    addMeasure(rqst.toString());
    return true;
  }

  @Override
  public void mixLogin(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_login_txnname);
    rqst.addParam(p_id);

    addMeasure(rqst.toString());
  }
  @Override
  public void mixFilter(long p_id, byte[] macAddr, byte[] ipAddr, long timestamp) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_filter_txnname);
    rqst.addParam(p_id);
    rqst.addParam(IPNode.addrToID(ipAddr));
    rqst.addParam(DeviceNode.addrToID(macAddr));

    addMeasure(rqst.toString());
  }
  @Override
  public void mixPay(long p_id1, long p_id2) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_pay_txnname);
    rqst.addParam(p_id1);
    rqst.addParam(p_id2);

    addMeasure(rqst.toString());
  }
  @Override
  public int mixOneHop(long p_id1, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_one_hop_txnname);
    rqst.addParam(p_id1);
    rqst.addParam(offset);
    rqst.addParam(limit);
    addMeasure(rqst.toString());
    return 1;
  }
  @Override
  public void mixRecom(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_recom_txnname);
    rqst.addParam(p_id);

    addMeasure(rqst.toString());
  }
  @Override
  public void mixLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_like_txnname);
    rqst.addParam(p_id);
    rqst.addParam(m_id);

    addMeasure(rqst.toString());
  }
  @Override
  public void mixDislike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_dislike_txnname);
    rqst.addParam(p_id);
    rqst.addParam(m_id);

    addMeasure(rqst.toString());
  }
}