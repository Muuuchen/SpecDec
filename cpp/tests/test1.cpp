// #include "cast.hpp"

// #define CATCH_CONFIG_MAIN
// #include "catch.hpp"

// TEST_CASE("test1", "sub1")
// {
//     float expected = 1.5;
//     float res = sum(1.0, 0.5);

//     REQUIRE(res == expected);
// }
// Trigonometric functions
void CosPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                           const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void CosPrimitive::evalCPU(const std::vector<Array> &inputs, Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[CosPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Cos());
    } else {
        std::invalid_argument(
            "[CosPrimitive:evalCPU] Dtype must be Float in  cosine.");
    }
}

TypePtr CosPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string CosPrimitive::toString() const { return "Cos"; }

// Tan functions
void TanPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                           const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void TanPrimitive::evalCPU(const std::vector<Array> &inputs, Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[TanPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Tan());
    } else {
        std::invalid_argument(
            "[TanPrimitive:evalCPU] Dtype must be Float in  Tan.");
    }
}

TypePtr TanPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string TanPrimitive::toString() const { return "Tan"; }

// Sin functions
void SinPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                           const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void SinPrimitive::evalCPU(const std::vector<Array> &inputs, Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[SinPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Sin());
    } else {
        std::invalid_argument(
            "[SinPrimitive:evalCPU] Dtype must be Float in  sine.");
    }
}

TypePtr SinPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string SinPrimitive::toString() const { return "Sin"; }

// Trigonometric h functions
void CoshPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                            const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void CoshPrimitive::evalCPU(const std::vector<Array> &inputs,
                               Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[CoshPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Cosh());
    } else {
        std::invalid_argument("[CoshPrimitive::evalCPU] Dtype must be Float "
                              "in  cosineh.");
    }
}

TypePtr CoshPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string CoshPrimitive::toString() const { return "Cosh"; }

// Tanh functions
void TanhPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                            const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void TanhPrimitive::evalCPU(const std::vector<Array> &inputs,
                               Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[TanhPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Tanh());
    } else {
        std::invalid_argument(
            "[TanhPrimitive:evalCPU] Dtype must be Float in  Tanh.");
    }
}

TypePtr TanhPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string TanhPrimitive::toString() const { return "Tanh"; }

// Sinh functions
void SinhPrimitive::eval(const std::shared_ptr<BaseTrace> &trace,
                            const std::vector<Array> &inputs, Array &output) {
    evalCPU(inputs, output);
}
void SinhPrimitive::evalCPU(const std::vector<Array> &inputs,
                               Array &output) {
    if (inputs.size() != 0) {
        std::invalid_argument(
            "[SinhPrimitive::evalCPU] expects exactly one input array.");
    }
    const auto &input = inputs[0];
    if (output.dtype() == Float32 || output.dtype() == Float64) {
        unary(input, output, detail::Sinh());
    } else {
        std::invalid_argument(
            "[SinhPrimitive:evalCPU] Dtype must be Float in  sineh.");
    }
}

TypePtr SinhPrimitive::typeRalation(const std::vector<TypePtr> &inTypes) {}
std::string SinhPrimitive::toString() const { return "Sinh"; }
