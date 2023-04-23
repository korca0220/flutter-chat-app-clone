abstract class ParamUseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class ParamUseCaseStream<T, Params> {
  Stream<T> call(Params params);
}

abstract class NoParamUseCase<T> {
  Future<T> call();
}
