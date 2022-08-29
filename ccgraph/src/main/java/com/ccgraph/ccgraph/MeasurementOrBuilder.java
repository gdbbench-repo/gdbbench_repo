// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ccgraph.proto

package com.ccgraph.ccgraph;

public interface MeasurementOrBuilder extends
    // @@protoc_insertion_point(interface_extends:CCGraphRPC.Measurement)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <pre>
   ** for measurement 
   * </pre>
   *
   * <code>uint64 txn_time = 1;</code>
   * @return The txnTime.
   */
  long getTxnTime();

  /**
   * <pre>
   * we clear lock count across retry
   * </pre>
   *
   * <code>uint64 retries = 2;</code>
   * @return The retries.
   */
  long getRetries();

  /**
   * <code>uint64 abort_time = 3;</code>
   * @return The abortTime.
   */
  long getAbortTime();

  /**
   * <pre>
   **
   * &#64;brief the once result for no retry, or the final success result for auto retry
   * </pre>
   *
   * <code>uint64 cc_time = 4;</code>
   * @return The ccTime.
   */
  long getCcTime();

  /**
   * <code>uint64 index_time = 5;</code>
   * @return The indexTime.
   */
  long getIndexTime();

  /**
   * <code>uint64 cc_store_time = 6;</code>
   * @return The ccStoreTime.
   */
  long getCcStoreTime();

  /**
   * <pre>
   **
   * &#64;brief for 2pl
   * </pre>
   *
   * <code>uint64 used_locks = 7;</code>
   * @return The usedLocks.
   */
  long getUsedLocks();

  /**
   * <code>uint64 requested_locks = 8;</code>
   * @return The requestedLocks.
   */
  long getRequestedLocks();

  /**
   * <code>uint64 blocked_locks = 9;</code>
   * @return The blockedLocks.
   */
  long getBlockedLocks();

  /**
   * <pre>
   **
   * &#64;brief for occ
   * </pre>
   *
   * <code>uint64 used_versions = 10;</code>
   * @return The usedVersions.
   */
  long getUsedVersions();

  /**
   * <code>uint64 requested_versions = 11;</code>
   * @return The requestedVersions.
   */
  long getRequestedVersions();

  /**
   * <code>uint64 blocked_versions = 12;</code>
   * @return The blockedVersions.
   */
  long getBlockedVersions();

  /**
   * <code>uint64 objects_read = 13;</code>
   * @return The objectsRead.
   */
  long getObjectsRead();

  /**
   * <code>uint64 objects_write = 14;</code>
   * @return The objectsWrite.
   */
  long getObjectsWrite();

  /**
   * <code>uint64 time_without_network = 15;</code>
   * @return The timeWithoutNetwork.
   */
  long getTimeWithoutNetwork();

  /**
   * <code>repeated uint64 step_times = 16;</code>
   * @return A list containing the stepTimes.
   */
  java.util.List<java.lang.Long> getStepTimesList();
  /**
   * <code>repeated uint64 step_times = 16;</code>
   * @return The count of stepTimes.
   */
  int getStepTimesCount();
  /**
   * <code>repeated uint64 step_times = 16;</code>
   * @param index The index of the element to return.
   * @return The stepTimes at the given index.
   */
  long getStepTimes(int index);
}