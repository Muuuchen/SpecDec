// 从基类到派生类的转换

// 动态转换常用来验证 检查一个对象是否为某个对象

class Entity
{
public:
    virtual void fun();
};

// 必须有虚函数表 然后才能进行动态转换

class Player : public Entity
{
};

class Enemy : public Entity
{
};
// 三种类型

int main()
{
    Entity *e = new Entity();
    // 类似于没有什么意义
    Player *p = static_cast<Player *>(e);
    //dynamic
    // must have a polymorphic class type
    // 也就是必须要有虚函数表
    // 通过判断两个虚函数地址表，是否相同

}

// 如果强制转换有效那么会返回想要的指针的值
// 否则 会返回一个null

// RTTI类型运行时信息，会增加开销，


//static_cast的强制转化没有多态检查，没有运行时检查，所以是不安全的。
//可能会访问不属于自己的内存。


//那么我们可做很多c风格转换。