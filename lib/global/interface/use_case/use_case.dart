abstract class ParamUseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class NoParamUseCase<T> {
  Future<T> call();
}
