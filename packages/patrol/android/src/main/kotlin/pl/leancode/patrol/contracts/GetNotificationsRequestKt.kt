// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: contracts.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package pl.leancode.patrol.contracts;

@kotlin.jvm.JvmName("-initializegetNotificationsRequest")
public inline fun getNotificationsRequest(block: pl.leancode.patrol.contracts.GetNotificationsRequestKt.Dsl.() -> kotlin.Unit): pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest =
  pl.leancode.patrol.contracts.GetNotificationsRequestKt.Dsl._create(pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest.newBuilder()).apply { block() }._build()
/**
 * Protobuf type `patrol.GetNotificationsRequest`
 */
public object GetNotificationsRequestKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest = _builder.build()
  }
}
public inline fun pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest.copy(block: pl.leancode.patrol.contracts.GetNotificationsRequestKt.Dsl.() -> kotlin.Unit): pl.leancode.patrol.contracts.Contracts.GetNotificationsRequest =
  pl.leancode.patrol.contracts.GetNotificationsRequestKt.Dsl._create(this.toBuilder()).apply { block() }._build()

