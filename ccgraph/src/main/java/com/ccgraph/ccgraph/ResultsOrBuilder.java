// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ccgraph.proto

package com.ccgraph.ccgraph;

public interface ResultsOrBuilder extends
    // @@protoc_insertion_point(interface_extends:CCGraphRPC.Results)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <code>.CCGraphRPC.Code code = 1;</code>
   * @return The enum numeric value on the wire for code.
   */
  int getCodeValue();
  /**
   * <code>.CCGraphRPC.Code code = 1;</code>
   * @return The code.
   */
  com.ccgraph.ccgraph.Code getCode();

  /**
   * <code>repeated bytes col_name = 2;</code>
   * @return A list containing the colName.
   */
  java.util.List<com.google.protobuf.ByteString> getColNameList();
  /**
   * <code>repeated bytes col_name = 2;</code>
   * @return The count of colName.
   */
  int getColNameCount();
  /**
   * <code>repeated bytes col_name = 2;</code>
   * @param index The index of the element to return.
   * @return The colName at the given index.
   */
  com.google.protobuf.ByteString getColName(int index);

  /**
   * <code>repeated .CCGraphRPC.RetRow table = 3;</code>
   */
  java.util.List<com.ccgraph.ccgraph.RetRow> 
      getTableList();
  /**
   * <code>repeated .CCGraphRPC.RetRow table = 3;</code>
   */
  com.ccgraph.ccgraph.RetRow getTable(int index);
  /**
   * <code>repeated .CCGraphRPC.RetRow table = 3;</code>
   */
  int getTableCount();
  /**
   * <code>repeated .CCGraphRPC.RetRow table = 3;</code>
   */
  java.util.List<? extends com.ccgraph.ccgraph.RetRowOrBuilder> 
      getTableOrBuilderList();
  /**
   * <code>repeated .CCGraphRPC.RetRow table = 3;</code>
   */
  com.ccgraph.ccgraph.RetRowOrBuilder getTableOrBuilder(
      int index);

  /**
   * <code>.CCGraphRPC.Measurement measure = 4;</code>
   * @return Whether the measure field is set.
   */
  boolean hasMeasure();
  /**
   * <code>.CCGraphRPC.Measurement measure = 4;</code>
   * @return The measure.
   */
  com.ccgraph.ccgraph.Measurement getMeasure();
  /**
   * <code>.CCGraphRPC.Measurement measure = 4;</code>
   */
  com.ccgraph.ccgraph.MeasurementOrBuilder getMeasureOrBuilder();
}
