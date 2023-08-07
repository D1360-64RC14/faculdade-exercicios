package validation

type Rule[T comparable] func(content T) error
