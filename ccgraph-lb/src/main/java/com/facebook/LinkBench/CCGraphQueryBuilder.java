package com.facebook.LinkBench;
import com.ccgraph.ccgraph.Request;
import com.google.protobuf.ByteString;

public class CCGraphQueryBuilder {
  StringBuilder sb;
  String txnName;
  public CCGraphQueryBuilder() {
    sb = new StringBuilder();
    sb.append("query ");
  }
  public void setTxnName(final String name) {
    sb.append(name);
    txnName = name;
  }
  public String getTxnName() {
    return txnName;
  }
  public void addParam(final long val) {
    sb.append('|'); sb.append(String.valueOf(val));
  }
  public void addParam(final byte[] val) {
    sb.append('|'); sb.append(val);
  }
  public void addParam(final String val) {
    sb.append('|'); sb.append(val);
  }
  public void addParam(final int val) {
    sb.append('|'); sb.append(String.valueOf(val));
  }
  public void addParam(final byte val) {
    sb.append('|'); sb.append(String.valueOf(val));
  }
  public Request build() {
    Request.Builder bder = Request.newBuilder();
    bder.setCommand(ByteString.copyFromUtf8(sb.toString()));
    return bder.build();
  }
  public String toString() {
    return sb.toString();
  }
}
