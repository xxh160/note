# c+-

记一些`c/c++`相关的有意思的东西。

## 数组与指针

### 强转指针

```c++
int n;
scanf("%d", &n);
char **a;
a = (char**) malloc (n * n * sizeof(char));
for (int i = 0; i < n; ++i) 
    for (int j = 0; j < n; ++j) { 
        printf("%p ", *a + n * i + j);
        printf("%p\n", *(a + i) + j);
    }
```

本来是想偷懒不用循环`new`的，但却出现了一些意料之外的结果。

输出是这样的：

```shell
(nil) (nil)
0x1 0x1
0x2 0x2
0x3 (nil)
0x4 0x1
0x5 0x2
0x6 (nil)
0x7 0x1
0x8 0x2
```

`malloc`返回的本身是`void*`，把它强行转成`char**`会发生什么？

`void*`原本就是一个纯粹的用来存放地址的类型，`malloc`返回的就是堆中分配的内存的首地址。

还有这段代码，运行结果和电脑是大端小端似乎有关系：

```c++
int a[10];
int *b;
const int *c;
int const *d;
char e;
cout << a << " " << &a << " " << &a[0] << endl;
cout << b << " " << &b << " " << &b[0] << endl;
cout << c << " " << &c << endl;
cout << d << " " << &d << endl;
printf("%p\n", &e);
```

和这段一起看：

```c++
class ArrayList {
public:
    int length = 0;
    int array[0];
};

int main() {
    ArrayList a;
    cout << &a.length << " " << a.array << " " << &a.array << endl;
    cout << sizeof(a) << endl;
    return 0;
}
```
