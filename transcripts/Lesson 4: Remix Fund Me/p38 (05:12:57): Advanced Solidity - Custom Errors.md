Alright, great.
好的，太棒了

So we've just made our contract a little bit more gas efficient,
所以我们在上一讲，让我们的合约节省了更多的 Gas

little gas efficiency improvements are going to be
这些小的 Gas 效率改进将是我在整个课程中涵盖的概念之一

concept I sprinkled throughout this course. And when we get to
当我们进入更高级的部分时

the more advanced section, I'm going to break down exactly
我将准确地分析发生了什么

what's going on and why all these gas efficiencies exist and
为什么存在这些 Gas 效率提升

what's going on behind the scenes for these gas
以及这些 Gas 效率提高发生的幕后原因是什么

efficiencies to occur. It's a little bit in the weeds, which
但这有点像是杂草，

is why I'm going to gloss over it right now.
这就是为什么我现在要略过它

So if it's confusing, don't worry, I wouldn't let these gas
因此，如果它令人困惑，不要担心，

efficiencies be the thing that slow you down. Awesome. So we
我不会让这些 Gas 效率问题成为拖累你的东西

have these two gas optimizations? How else can we
所以，除了上一节的两个 Gas 优化以外，

make this contract a little bit more gas efficient? Well, one of
我们还可以如何使这个合约的 Gas 效率更高一点？

the ways we can make this more gas efficient, is by updating
好吧，我们可以让这个合约更省 Gas，其中一个方法

our requires. Right now with our require statement, we actually
就是通过更新我们 require 语句

have to store this sender is not an owner as a string array,
现在，在我们的 require 语句中，我们实际上必须把这个"Sender is not owner!" 存储为一个字符串数组

every single one of these characters in this errorlog
这个错误日志中的每一个字符都需要被单独存储，

needs to get stored individually, this string may
这个字符串可能看起来不是很大，

not seem very big, but it's a lot bigger than the alternative
但它比我们能做的替代方案大很多

with what we can do. As of zero, point 8.4 of Solidity, you can
从 Solidity v0.8.4 版本开始，你现在实际上可以使用自定义错误

now actually do custom errors. For our reverts, we declare them
对于我们的 revert 来说，我们可以在顶部声明它们

at the top and then use ifs, instead of require and then just
然后使用 if，而不是 require，然后只是添加一个 revert 语句

add a revert statements. This ends up saving a lot of gas,
这最终可以节省大量的 Gas

since we just call the error code, as opposed to calling the
因为我们只是调用 error code 错误代码

entire string associated with the air. So for example, with
而不是调用与 error 相关的整个字符串

our require down here, and with actually with all of our
例如，在我们的 require 语句下面这里，

requires, well we could do is instead of having this require
实际上我们所有的 require 都是如此

we could create a custom error. So at the top, what we could do
我们可以不使用这个 require，而是创建一个自定义错误

is we could say error, not owner. And you'll notice that
所以在顶部，我们可以做的是，使用 error NotOwner();

this is actually outside of the contract here. Now what we can
你会注意到，这实际上是在合约之外的

do is we can take this error not owner scroll down into our only
现在我们可以做的是，我们可以把这个 "NotOwner error" 往下放到 onlyOwner {} 中

owner, instead of doing a require we'll do an if
不再使用一个 require，而是使用一个 if 语句

statement, we'll say if message dot sender is not owner, then
我们会说 if(msg. sender != i_owner)

we're going to go ahead and revert with a non owner error.
那么我们就会继续前进，用一个 NotOwner error 来 revert

This ends up saving us a lot of gas, since we don't have to
这最终为我们节省了大量的 Gas，因为我们不必在这里存储和发送这个长字符串

store and emit this long string here. Now in a lot of code
现在在很多代码中，

today, you'll still see require a lot of places because these
你仍然会在很多地方看到 require 语句

these custom errors are pretty new in Solidity. So you'll want
因为这些自定义错误在 Solidity 中是非常新的

to get used to writing in both ways. I wouldn't be surprised if
所以你要习惯于用两种方式来写

in the future, the syntax for some of these errors looks like
如果在未来，这些错误的语法看起来像这样

this so that it's more readable. But for now, if you want to do a
我也不会感到惊讶，因为它更具有可读性

more gas efficient way than required, you can use something
但是现在，如果你想做一个比要求更省 Gas 的方式

like this, we could update all of our requires here for these
你可以使用这样的东西，我们可以在这里为这些客户更新所有的 require 语句

customers. But for now, I'm going to leave both in just to
但是现在，我打算把这两个都留在里面，

show you the differences. This revert keyword does the exact
只是为了向你展示其中的区别

same thing that required us without the conditional
这个 revert 关键字所做的事情与之前没有判断条件时完全一样

beforehand. So you can actually go ahead and revert any
因此，你实际上可以在函数调用的中途，

transaction or any function call in the middle of the function call.
去恢复任何事务或任何函数调用
