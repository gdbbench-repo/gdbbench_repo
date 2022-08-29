package com.facebook.LinkBench;
import com.ccgraph.ccgraph.Results;

import com.ccgraph.ccgraph.Code;
import com.ccgraph.ccgraph.Measurement;

public class CCGraphResultResolver {
  Results rply;
  public CCGraphResultResolver(Results rply) {
    this.rply = rply;
  }
  int row() {
    return rply.getTableCount();
  }
  boolean isOk() {
    return rply.getCode().equals(Code.kOk);
  }
  boolean isAbort() {
    return rply.getCode().equals(Code.kAbort);
  }
  byte[] getBytes(final int i, final int j) {
    return rply.getTable(i).getOneRow(j).toByteArray();
  }
  int getInt(final int i, final int j) {
    return Integer.valueOf(rply.getTable(i).getOneRow(j).toStringUtf8()).intValue();
  }
  long getLong(final int i, final int j) {
    return Long.valueOf(rply.getTable(i).getOneRow(j).toStringUtf8()).longValue();
  }
  byte getByte(final int i, final int j) {
    return Byte.valueOf(rply.getTable(i).getOneRow(j).toStringUtf8()).byteValue();
  }
  String getStr(final int i, final int j) {
    return rply.getTable(i).getOneRow(j).toStringUtf8();
  }
  String errMsg() {
    return rply.getTable(0).getOneRow(0).toStringUtf8();
  }
  Measurement getMeasure() {
    return rply.getMeasure();
  }
  public static String getMeasureTrace(Measurement m) {
    StringBuilder sb = new StringBuilder();
    sb.append(m.getTxnTime());
    sb.append(","); sb.append(m.getRetries());
    sb.append(","); sb.append(m.getAbortTime());
    sb.append(","); sb.append(m.getCcTime());
    sb.append(","); sb.append(m.getIndexTime());
    sb.append(","); sb.append(m.getCcStoreTime());
    sb.append(","); sb.append(m.getUsedLocks());
    sb.append(","); sb.append(m.getRequestedLocks());
    sb.append(","); sb.append(m.getBlockedLocks());
    sb.append(","); sb.append(m.getUsedVersions());
    sb.append(","); sb.append(m.getRequestedVersions());
    sb.append(","); sb.append(m.getBlockedVersions());
    sb.append(","); sb.append(m.getObjectsRead());
    sb.append(","); sb.append(m.getObjectsWrite());
    sb.append(","); sb.append(m.getTimeWithoutNetwork());
    for(int i = 0; i < m.getStepTimesCount(); i++) {
      sb.append(","); sb.append(m.getStepTimes(i));
    }
    return sb.toString();
    // return "";
  }
  // long getMeasure(int i) {
  //   return rply.getMeasure(i);
  // }
  // int getMeasureCount() {
  //   return rply.getMeasureCount();
  // }
  static CCGraphResultResolver build(Results rply) {
    return new CCGraphResultResolver(rply);
  }
}
