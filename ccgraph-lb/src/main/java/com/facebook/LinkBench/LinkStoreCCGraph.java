package com.facebook.LinkBench;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.StatusRuntimeException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.Properties;
import java.io.IOException;
import com.google.protobuf.ByteString;

import com.ccgraph.ccgraph.Request;

import com.ccgraph.ccgraph.CCGraphServerGrpc;
import com.ccgraph.ccgraph.Measurement;
import com.facebook.LinkBench.measurements.Measurements;
import com.facebook.LinkBench.measurements.OneMeasurementTrace;

/**
 * A simple client that requests a greeting from the {@link HelloWorldServer}.
 */
public class LinkStoreCCGraph extends GraphStore {
  private static final Logger logger = Logger.getLogger(LinkStoreCCGraph.class.getName());

  private static ManagedChannel channel = null;
  private CCGraphServerGrpc.CCGraphServerBlockingStub blockingStub;

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
    String host = p.getProperty("host", "127.0.0.1");
    int port = Integer.parseInt(p.getProperty("port", "55555"));

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

    synchronized(LinkStoreCCGraph.class) {
      if (channel == null) 
        channel = ManagedChannelBuilder.forAddress(host, port).usePlaintext().build();
      this.blockingStub = CCGraphServerGrpc.newBlockingStub(channel);
    }
    OneMeasurementTrace.setSerializer(new OneMeasurementTrace.ObjSerializer(){
      @Override
      public String str(Object obj) {
        return CCGraphResultResolver.getMeasureTrace((Measurement)obj);
      }
    });
    int retryCur = 0;
    final int retryWaitStep = 100; // ms
    final int retryMaxWait = ConfigUtil.getInt(p, "ccgraph.online_timeout", 100) * 1000; // default 100s
    while (true) {
      Request.Builder bder = Request.newBuilder();
      bder.setCommand(ByteString.copyFromUtf8("ping"));
      try {
        blockingStub.execute(bder.build());
        System.err.println("CCGraph Server is online!");
        break;
      } catch (Exception e) {
        if (retryCur < retryMaxWait) {
          retryCur += retryWaitStep;
          Thread.sleep(retryWaitStep);
          if (retryCur % 1000 == 0) {
            System.err.println("Waiting for CCGraph go online for " + (retryCur / 1000) + "sec.");
          }
        } else {
          System.err.println("CCGraph Server not launched!");
          System.exit(1);
        }
      }
    }
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

  public void shutdown() throws InterruptedException {
    channel.shutdown().awaitTermination(5, TimeUnit.SECONDS);
  }

  private void checkDBID(String dbid) {
    if (_dbidready == false) {
      synchronized(LinkStoreCCGraph.class) {
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

  CCGraphResultResolver execute(CCGraphQueryBuilder rqst) {
    return CCGraphResultResolver.build(blockingStub.execute(rqst.build()));
  }

  private void addMeasure(Measurement obj) {
    _measurements.measureTrace("operation", threadId, obj);
  }

  public boolean aliUpdateNode(String dbid, Node node) throws Exception {
    long start_time = System.nanoTime();
    checkDBID(dbid);
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("ali_login");
    rqst.addParam(node.id);

    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("Update node failed: (%d, %d)", node.id, node.type));
    }
    addMeasure(rply.getMeasure());

    return rply.isOk();
  }

  // for benching
  @Override
  public int RecurUpdate(long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.recur_update");
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("RecurUpdate failed: (%d)", m_id));
    }
    _measurements.measureTrace("RecurUpdateTrace", threadId, rply.getMeasure());
    return rply.getInt(0, 0);
  }
  @Override
  public boolean OneHopScan(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.one_hop_scan");
    rqst.addParam(p_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("OneHopScan failed: (%d)", p_id));
    }
    _measurements.measureTrace("OneHopScanTrace", threadId, rply.getMeasure());
    return rply.isOk();
  }
  @Override
  public boolean TwoHopScan(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.two_hop_scan");
    rqst.addParam(p_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("TwoHopScan failed: (%d)", p_id));
    }
    _measurements.measureTrace("TwoHopScanTrace", threadId, rply.getMeasure());
    return rply.isOk();
  }
  @Override
  public boolean UpsertLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.upsert_like");
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("UpsertLike failed: (%d, %d)", p_id, m_id));
    }
    _measurements.measureTrace("UpsertLikeTrace", threadId, rply.getMeasure());
    return rply.isOk();
  }
  @Override
  public boolean DeleteLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.delete_like");
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("DeleteLike failed: (%d, %d) %s", p_id, m_id, rply.errMsg()));
    }
    _measurements.measureTrace("DeleteLikeTrace", threadId, rply.getMeasure());
    return rply.isOk();
  }
  @Override 
  public boolean UpdateMsg(long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName("benching.update_node");
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("UpdateMsg failed: (%d)", m_id));
    }
    _measurements.measureTrace("UpdateMsgTrace", threadId, rply.getMeasure());
    return rply.isOk();
  }

  @Override
  public UserNode[] aliGetFan(long id, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliGetFan_txnname);
    rqst.addParam(id);
    rqst.addParam(offset);
    rqst.addParam(limit);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliGetFan failed: (%d)", id));
    }
    _measurements.measureTrace("aliGetFanTrace", threadId, rply.getMeasure());
    return new UserNode[0];
  }

  @Override
  public UserNode[] aliGetFollow(long id, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliGetFollow_txnname);
    rqst.addParam(id);
    rqst.addParam(offset);
    rqst.addParam(limit);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliGetFollow failed: (%d)", id));
    }
    _measurements.measureTrace("aliGetFollowTrace", threadId, rply.getMeasure());
    return new UserNode[0];
  }

  @Override
  public UserNode[] aliRecom(long id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliRecom_txnname);
    rqst.addParam(id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliRecom failed: (%d)", id));
    }
    _measurements.measureTrace("aliRecomTrace", threadId, rply.getMeasure());
    return new UserNode[0];
  }
  @Override
  public boolean aliFollow(LinkFollow l) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliFollow_txnname);
    rqst.addParam(l.id1);
    rqst.addParam(l.id2);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliFollow failed: (%d, %d)", l.id1, l.id2));
    }
    _measurements.measureTrace("aliFollowTrace", threadId, rply.getMeasure());
    return true;
  }
  @Override
  public boolean aliUnfollow(long id1, long id2) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliUnfollow_txnname);
    rqst.addParam(id1);
    rqst.addParam(id2);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliUnfollow failed: (%d, %d)", id1, id2));
    }
    _measurements.measureTrace("aliUnfollowTrace", threadId, rply.getMeasure());
    return true;
  }
  @Override
  public long aliLogin(long id, byte[] macAddr, byte[] ipAddr, long timestamp) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliLogin_txnname);
    rqst.addParam(id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliLogin failed: (%d)", id));
    }
    _measurements.measureTrace("aliLoginTrace", threadId, rply.getMeasure());
    return 1;
  }
  @Override
  public boolean aliPay(long id1, long id2, long amount) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliPay_txnname);
    rqst.addParam(id1);
    rqst.addParam(id2);
    rqst.addParam(amount);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliPay failed: (%d, %d)", id1, id2));
    }
    _measurements.measureTrace("aliPayTrace", threadId, rply.getMeasure());
    return true;
  }

  @Override
  public long aliLoginSimple(long id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliLoginSimple_txnname);
    rqst.addParam(id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliLoginSimple failed: (%d)", id));
    }
    _measurements.measureTrace("aliLoginSimpleTrace", threadId, rply.getMeasure());
    return 1;
  }
  @Override
  public boolean aliFilter(long id, byte[] macAddr, byte[] ipAddr, long timestamp) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_aliFilter_txnname);
    rqst.addParam(id);
    rqst.addParam(IPNode.addrToID(ipAddr));
    rqst.addParam(DeviceNode.addrToID(macAddr));
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {
      throw new Exception(String.format("aliFilter failed: (%d)", id));
    }
    _measurements.measureTrace("aliFilterTrace", threadId, rply.getMeasure());
    return true;
  }

  @Override
  public void mixLogin(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_login_txnname);
    rqst.addParam(p_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixLogin failed: (%d)", p_id));}
    _measurements.measureTrace("mixLoginTrace", threadId, rply.getMeasure());
  }
  @Override
  public void mixFilter(long p_id, byte[] macAddr, byte[] ipAddr, long timestamp) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_filter_txnname);
    rqst.addParam(p_id);
    rqst.addParam(IPNode.addrToID(ipAddr));
    rqst.addParam(DeviceNode.addrToID(macAddr));
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixFilter failed: (%d)", p_id));}
    _measurements.measureTrace("mixFilterTrace", threadId, rply.getMeasure());
  }
  @Override
  public void mixPay(long p_id1, long p_id2) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_pay_txnname);
    rqst.addParam(p_id1);
    rqst.addParam(p_id2);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixPay failed: (%d, %d)", p_id1, p_id2));}
    _measurements.measureTrace("mixPayTrace", threadId, rply.getMeasure());
  }
  @Override
  public int mixOneHop(long p_id1, int offset, int limit) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_one_hop_txnname);
    rqst.addParam(p_id1);
    rqst.addParam(offset);
    rqst.addParam(limit);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixOneHop failed: (%d)", p_id1));}
    _measurements.measureTrace("mixOneHopTrace", threadId, rply.getMeasure());
    return rply.getInt(0, 0);
  }
  @Override
  public void mixRecom(long p_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_recom_txnname);
    rqst.addParam(p_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixRecom failed: (%d)", p_id));}
    _measurements.measureTrace("mixRecomTrace", threadId, rply.getMeasure());
  }
  @Override
  public void mixLike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_like_txnname);
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixLike failed: (%d, %d)", p_id, m_id));}
    _measurements.measureTrace("mixLikeTrace", threadId, rply.getMeasure());
  }
  @Override
  public void mixDislike(long p_id, long m_id) throws Exception {
    CCGraphQueryBuilder rqst = new CCGraphQueryBuilder();
    rqst.setTxnName(ccgraph_mix_dislike_txnname);
    rqst.addParam(p_id);
    rqst.addParam(m_id);
    CCGraphResultResolver rply = execute(rqst);
    if (!rply.isOk()) {throw new Exception(String.format("mixDislike failed: (%d, %d)", p_id, m_id));}
    _measurements.measureTrace("mixDislikeTrace", threadId, rply.getMeasure());
  }

  public static void main(String[] args) {
    ManagedChannel channel = ManagedChannelBuilder.forAddress("val06", 55552).usePlaintext().build();
    CCGraphServerGrpc.CCGraphServerBlockingStub blockingStub = CCGraphServerGrpc.newBlockingStub(channel);
    long cnt = 0;
    long startTime = System.currentTimeMillis();
    while(true) {
      Request.Builder bder = Request.newBuilder();
      bder.setCommand(ByteString.copyFromUtf8("query idle_nop"));
      blockingStub.execute(bder.build());
      cnt++;
      long endTime = System.currentTimeMillis();
      if (endTime - startTime > 30*1000) break;
    }
    System.err.println("Finish " + cnt + " in 30s");
  }
}