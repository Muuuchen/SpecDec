#include <iostream>
#include <vector>
// 模板偏特化
/*
1. 函数模板，类模板
2. 模板实例化
3. 模板匹配
4. SFINAE
5. 模板特例化
*/
// 为什么需要模板，避免重载
// template <typename T> <class T>都可以
// 可以自动推导
// 特化的重载 重载的时候回用特化而不是模板（SFINAE）
// 默认参数类型， 如果没有出现在任何函数的参数中， 那么就用默认的 class T = int
// 模板参数中也可以作为函数的参数, int enum 模板参数和

/*
template <int N>
void show_times(std::string msg)
{
    for (int i = 0; i < N; i++)
    {
        std::cout << msg << std::endl;
    }
}

int main()
{
    show_times<1>("ones");
    show_times<3>("ones");
}
*/

// 多个模板参数

// c参数部分特化

// 补充int fun() const: 这个声明表示 fun() 是一个成员函数，并且在函数体内部不会修改调用对象的状态。这种声明通常用于类的成员函数，const 关键字放在函数的尾部，用来表示该函数不会修改对象的成员变量

// template <class T>
// T sum(std::vector<T> const &arr)
// {
//     T res = 0;
//     for (int i = 0; i < arr.size(); i++)
//     {
//         res += arr[i];
//     }
//     return res;
// }

// int main()
// {
//     std::vector<int> a = {4, 3, 2, 1};
//     std::vector<float> b = {1.0, 2, 54, 3};
//     std::cout << sum(a) << std::endl
//               << sum(b) << std::endl;
// }
// 为什么做整数模板参数
/*
template <int N> 传入的 N，是一个编译期常量，
每个不同的 N，编译器都会单独生成一份代码，
从而可以对他做单独的优化。

而 func(int N)，则变成运行期常量，
编译器无法自动优化，只能运行时根据被调用参数 N 的不同。

通常来说，模板的内部实现需要被暴露出来，除非使用特殊的手段，
否则，定义和实现都必须放在头文件里。，以确保模板的实现在每个使用它的文件中都可见

如果过度使用模板，会导致生成的二进制文件大小剧增，编译变得很慢等。

*/

// 这里的bool 用做调试信息，如果在编译期确定那么我们就不会，多进行一次分支判断
// template <bool debug>
// int sumto(int n)
// {
//     int res = 0;
//     for (int i = 0; i < n; i++)
//     {
//         if constexpr (debug)
//         {
//             std::cout << i << "-th" << res << std::endl;
//         }
//         res += i;
//     }
//     return res;
// }

// int main()
// {
//     // 这种不可以
//     constexpr bool debug = true; //  这种才可以并且 右边的值也必须是常量表达式。

//     std::cout << sumto<std::min(true, false)>(5) << std::endl;
//     std::cout << sumto<false>(5) << std::endl;
// }
// 可以用C++17的 if constexpr 语法，保证是编译期确定的分支：

// 不能通过运行时变量组成的表达式来指定。比如：

// 编译期 constexpr 的表达式，一般是无法调用其他函数的。
// nstexpr 函数不能调用 non-constexpr 函数。而且 constexpr 函数必须是内联（inline）的，不能分离声明和定义在另一个文件里。
// 标准库的很多函数如 std::min 也是 constexpr 函数
// 可以放心大胆在模板尖括号内使用。

// 模板函数的实现和声明不可以分离
// 编译器对模板的编译是惰性的，即只有当前 .cpp 文件用到了这个模板，该模板里的函数才会被定义

// 如果没有用到，那么就是function<>, 需要增加两个显式编译模板的声明：
// template int sumto<true>(int n);
// template int sumto<false>(int n);

/// 他是惰性的！！ 根本没有被编译
// template <class T = void>
// void fun()
// {
//     "sdsdd" = "asdasd";
// }

// int main()
// {

//     return 0;
// }
// 示例

template <class T>
std::ostream &operator<<(std::ostream &os, std::vector<T> const &a)
{
    os << "{";
    for (size_t i = 0; i < a.size(); i++)
    {
        os << a[i];
        if (i != a.size() - 1)
            os << ", ";
    }
    os << "}";
    return os;
}

int main()
{
    std::vector<int> a = {4, 3, 2, 1};
    std::vector<float> b = {1.0, 2, 54, 3};
    std::cout << a << b << std::endl;
}

