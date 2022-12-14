// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ccgraph.proto

package com.ccgraph.ccgraph;

/**
 * Protobuf enum {@code CCGraphRPC.Code}
 */
public enum Code
    implements com.google.protobuf.ProtocolMessageEnum {
  /**
   * <code>kOk = 0;</code>
   */
  kOk(0),
  /**
   * <code>kConflict = 1;</code>
   */
  kConflict(1),
  /**
   * <code>kAbort = 2;</code>
   */
  kAbort(2),
  /**
   * <code>kFatal = 3;</code>
   */
  kFatal(3),
  UNRECOGNIZED(-1),
  ;

  /**
   * <code>kOk = 0;</code>
   */
  public static final int kOk_VALUE = 0;
  /**
   * <code>kConflict = 1;</code>
   */
  public static final int kConflict_VALUE = 1;
  /**
   * <code>kAbort = 2;</code>
   */
  public static final int kAbort_VALUE = 2;
  /**
   * <code>kFatal = 3;</code>
   */
  public static final int kFatal_VALUE = 3;


  public final int getNumber() {
    if (this == UNRECOGNIZED) {
      throw new java.lang.IllegalArgumentException(
          "Can't get the number of an unknown enum value.");
    }
    return value;
  }

  /**
   * @param value The numeric wire value of the corresponding enum entry.
   * @return The enum associated with the given numeric wire value.
   * @deprecated Use {@link #forNumber(int)} instead.
   */
  @java.lang.Deprecated
  public static Code valueOf(int value) {
    return forNumber(value);
  }

  /**
   * @param value The numeric wire value of the corresponding enum entry.
   * @return The enum associated with the given numeric wire value.
   */
  public static Code forNumber(int value) {
    switch (value) {
      case 0: return kOk;
      case 1: return kConflict;
      case 2: return kAbort;
      case 3: return kFatal;
      default: return null;
    }
  }

  public static com.google.protobuf.Internal.EnumLiteMap<Code>
      internalGetValueMap() {
    return internalValueMap;
  }
  private static final com.google.protobuf.Internal.EnumLiteMap<
      Code> internalValueMap =
        new com.google.protobuf.Internal.EnumLiteMap<Code>() {
          public Code findValueByNumber(int number) {
            return Code.forNumber(number);
          }
        };

  public final com.google.protobuf.Descriptors.EnumValueDescriptor
      getValueDescriptor() {
    if (this == UNRECOGNIZED) {
      throw new java.lang.IllegalStateException(
          "Can't get the descriptor of an unrecognized enum value.");
    }
    return getDescriptor().getValues().get(ordinal());
  }
  public final com.google.protobuf.Descriptors.EnumDescriptor
      getDescriptorForType() {
    return getDescriptor();
  }
  public static final com.google.protobuf.Descriptors.EnumDescriptor
      getDescriptor() {
    return com.ccgraph.ccgraph.Ccgraph.getDescriptor().getEnumTypes().get(0);
  }

  private static final Code[] VALUES = values();

  public static Code valueOf(
      com.google.protobuf.Descriptors.EnumValueDescriptor desc) {
    if (desc.getType() != getDescriptor()) {
      throw new java.lang.IllegalArgumentException(
        "EnumValueDescriptor is not for this type.");
    }
    if (desc.getIndex() == -1) {
      return UNRECOGNIZED;
    }
    return VALUES[desc.getIndex()];
  }

  private final int value;

  private Code(int value) {
    this.value = value;
  }

  // @@protoc_insertion_point(enum_scope:CCGraphRPC.Code)
}

