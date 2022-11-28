We're going to modify this contract to make it
我们将修改这份合约，使其更专业一点

a little bit more professional. It's not going to be end to end
它不会是端到端都令人惊奇的

amazing, but it's going to be a little bit better. And you'll
但它将会更好一点，你将在一分钟内看到原因

see why in a minute. So the first thing that we're going to
因此，我们要做的第一件事是

do is we're looking we're going to look at some of these
让我们来检查这里的一些变量

variables here. In particular owner and minimumUsd, owner
特别是这里的 owner 和 minimumUsd 变量

gets set one time in our contract here. And then it never
owner 在我们的合约中被设定一次之后，它就不会再改变了

changes. Again, minimumUsd gets set one time, even outside of
同样，minimumUsd 也被设置一次，虽然在构造函数之外

the constructor. If we have variables that only get set one
如果我们有这种只需设置一次的变量

time, we can actually use some tools in Solidity to make them
实际上，我们可以使用 Solidity 中的一些工具让它更加节省 Gas

more gas efficient. For now let's compile our funding
现在让我们来编译我们的 FundMe 合约

contract, and then deploy it to a JavaScript virtual machine.
然后把它部署到 JavaScript 虚拟机上

Remember, we can go ahead and deploy it right now. However,
记住，我们现在就可以去部署它

funding and withdrawing and doing in the money stuff isn't
然而，fund 筹资和 withdraw 提款以及操作款项是不行的

going to work. Because again, we don't have a Chainlink network
因为我们的 JavaScript 虚拟机上没有 Chainlink 网络

on our JavaScript VM. So those aren't going to work so well.
这些都不能很好地生效

But for what we're gonna do right now, we don't really care
但是，对于我们现在要做的事情来说，我们并不关心那么多

so much. Here's what we do care about. You do care about how
下面才是我们关心的内容

much gas this costs to actually send. We do care about how much
你会需要关心这要花多少 Gas 才能真正发送

gas is costs to create right now creating this contract costs
需要关心的是，现在创建这个合约的成本约为 85.9 万 Gas

about 859,000 gas and we're going to Add a couple of tricks.
我们将添加一些技巧

Right now to bring this number down, we're going to add some
就是为了把这个数字降下来

stuff back in a bit, which will bring it back up. But for
我们会把一些东西加进去，让它恢复正常

now, we're going to learn some tricks to bring this number
但现在，我们要学习一些技巧，先把这个数字降下来

down. The two tricks that we're going to learn are the constant
我们要学习的两个技巧是 constant 关键词和 immutable 关键词

keyword and the immutable keyword, in their Solidity.
在 Solidity 中

There are two keywords that make it so that your variables can't
有两个关键字可以使你的变量不能被改变

be changed. And those keywords are constant and immutable. You
这些关键字就是 constant（常量）和 immutable（不可变的）

can learn more about them in the Solidity documentation, if you
你可以在 Solidity 文档中了解更多关于它们的信息

assign a variable once outside of a function, and then never
如果你只是在函数外分配一次变量，然后永远不再改变它

change it, so if if it's assigned at compile time, you
那么如果它是在编译时分配的

can go ahead and add this constant keyword. We'll learn
你就可以继续添加这个 constant 关键字。我们还将在后面学习存储时的知识

later about storage. But when you add a constant keyword, this
当你添加一个 constant 关键字时，这个 minimumUsd 不再占用一个存储空间

minimum USD no longer takes up a storage spot, and is much easier
而且也更容易阅读

to read too. So now we recompile this, and we deploy this new
所以现在我们重新编译，并部署这个新的合约

contract. Let's see if we saved any gas. We look in the
让我们看看我们是否节省了任何 Gas

transaction logs, now, we can grab the transaction cost of how
我们看一下交易日志，现在，我们可以找到交易成本

much this cost to deploy, let's compare it to how much it was
即部署这个合约的成本是多少，让我们把它与之前的成本进行比较

before. Well, we saved almost 19,000 gas, that's almost as
好吧，我们节省了将近 19000 个 Gas

much gas as a cost to send Ethereum. Typically, constant
这几乎和只发送 Ethereum 的成本一样多的 Gas

variables have a different naming convention. Typically,
通常情况下，常量变量有不同的命名规则

you'll want to do them all caps like Min imaam. Underscore, who
通常情况下，你会想把它们全部用大写字母表示，比如 MINIMUM_USD

is the CIO all caps with underscores. So now let's just
全部大写并使用下划线

find minimum use D, and replace that with all caps as well. With
所以现在让我们找到所有的 minimumUsd，并将其也替换为全大写

this interaction, we know that this variable is a constant
通过这种显式的提示，我们就知道这个变量是一个恒定的变量

variable, and it's much cheaper to read from now, if we go ahead
从现在开始，如果我们继续编译这个并重新部署，就会便宜很多

and compile this and redeploy. In our funding contract, even
在我们的 FundMe 合约中，尽管这是一个 view 函数

though this is a view function, remember, view functions do have
记住，当 view 函数被合约作为一个恒定变量调用时

gas costs when when called by contract as a constant variable,
确实是会产生 Gas 成本的

we can see the execution cost of this variable 21,415 gas. So
我们可以看到这个变量的执行成本是 21415 Gas

let's put a little note rather Nathan.
让我们留下一个小的记录

If we remove the constant variable, we delete this
如果我们删除这个常量变量，删除这个合约

contract. And we redeploy, like funding. And we hit minimum ust
然后我们重新部署，点击 FundMe 合约

again, we can now see how much gas this was cost. If it wasn't
我们再看一下 MINIMUM_USD，可以看到现在的成本是多少 Gas

a constant variable, we can see the gas cost did indeed go up.
当它不再是一个恒定变量，我们可以看到 Gas 成本确实上升了

Now unchanged that are much cheaper, this gas difference
现在之前不变的那个，则会便宜更多

probably won't make that much of a difference. But on more
这种 Gas 的差异可能不会有太大的影响

expensive chains like Ethereum, this is going to make a big
但是在像以太坊这样更昂贵的链上，这将会产生很大的差异

difference. For example, on Ethereum, we can actually see
例如，在以太坊上，我们实际上可以看到以太坊上当前的 Gas 价格

current gas prices on Ethereum. Here, we can see the current gas
在这里，我们可以看到目前以太坊的 Gas 价格大约是 141 gwei

price of Ethereum is about 141 gwei, so we'll go to our
所以我们将去我们的转换器

converter, way to way we'll copy the way price times this will
拿到对应的 Wei 值，然后复制并乘以价格

get the gas price of calling our minimum USD, which is this
得到调用我们的 MINIMUM_USD 的 Gas 价格

number here, which if we put back in our Ethereum
这是此时的数字，如果我们把它放回我们的以太坊单位转换器 Unit Converter

uniconverter, we can see cost this much gas. And if we times
我们可以看到将会花费这么多 Gas

that by the approximate current price of Ethereum, which is
如果我们把这个数字乘以 ETH 的当前价格，大约是 3000 美元

around $3,000. Calling minimum use D as a constant is going to
调用 MINIMUM_USD 作为 constant 常数要花费 9 美元

cost $9 on the inside is at a non-constant is going to cost
而使用 non-constant 非常数要多花费几乎整整 1 美元

almost an entire dollar more, you can see how all these little
你可以看到

gas optimization tricks are going to make your life a lot
所有这些小的 Gas 优化技巧将使你的生活好很多

better. So let's keep this constant keyword in here. We'll
因此，让我们在这里保持这个 constant 关键词

learn more about constant and storage in later sections of
我们将在本课程的后面章节中学习更多关于 constant 和 storage 的知识

this course. Now, as you're just getting started with this
现在，由于你刚刚开始学习这门课程

course, and with Solidity. Do not struggle and do not worry about
才刚开始学习 Solidity

making your contracts as gas efficient as possible in the
不要挣扎，也不要过于担心在开始的时候

beginning, and especially right now. Just write your contracts
尤其是现在，就想让你的合约尽可能的尽可能地节约 Gas

as best as you can. Once you get really good at gas. And once you
现在只要尽可能地写好你的合约就可以了。只要你真的变得很擅长使用 Gas，

get much later on in the course, and much more advanced with
当你在课程的后期，对 Solidity 有了更多的了解

Solidity, then you can start going back and working on gas
那么你就可以再开始回过头来对 Gas 进行优化

optimizations. But do not let gas optimizations hold you back.
但是现在不要让 Gas 优化阻碍你

Or if you start stressing over it, just let it go. Don't worry
如果你开始为它感到紧张了，那就随它去吧

about it and just write your code as best you can. So long
不要担心这个问题，只要尽力写好你的代码

story short, Do not stress about gas optimizations right now. Now
所以长话短说，现在不要对 Gas 优化有任何压力

another variable we only set one time is going to be our owner
现在，另一个只需设置一次的变量将是我们的 owner 变量

variable. Owner equals message dot sender. We set this one time
owner = msg.sender; 我们在构造函数变量中设置过一次

in the constructor. Variables that we set one time but outside
这些我们一次性设置的变量，是在它们被声明的同一行以外

of the same line that they're declared. And we set them for
如果我们在构造函数中设置它们，

example, in the constructor, we can mark as immutable typically
我们可以将其标记为 immutable 不可变的

a good convention for marking immutable variables is going to
通常标记 immutable 变量的一个很好的约定是使用 i_owner （i+下划线+变量名）

be doing i_underscore so that we know that these are immutable
这样我们就知道这些都是不可变的变量

variables, they have very similar gas savings to the
它们有非常类似于 constant 关键字的节约 Gas 的效果

constant keyword. Owner, of course, is a variable that we
当然，owner 是一个我们无法在这一行就设置好的变量

can't set on the line here because inside the global scope,
因为在全局范围内，没有函数会运行

there's no function going on. However, inside functions,
然而，在函数内部

because inside the global scope, there's going to be no message
因为在全局 scope 范围内，不会有 msg.sender

that sender, there's only going to be a message dot sender when
只有当我们在一个函数里面时，才会有一个 msg.sender

we're inside of a function. So inside here, we might say I
所以在函数内部，我们可能会说 i_owner=msg.sender;

owner equals message dot sender. And then of course, we'll scroll
当然，让我们向下滚动

down and we'll change this require only owner now equals i
我们会改变这个 require() 的 onlyOwner 变成 i_owner

owner. Now if we compile that deploy up, we can see how much
现在，如果我们把它编译部署起来，我们可以看到有多少 Gas

gas we can see how much gas calling i_owner is going to be
我们可以看到调用 i_owner 使用的是 immutable 的通知

by with immutable notice, we get 21,508, which we'll go ahead and
我们得到 21,508，我们现在就去复制这个

copy for now. And we'll put right here, we'll say,
我们把它放在这里，标记为 immutable

immutable. Now, if we remove the immutable keyword, let's close
现在，如果我们删除 immutable 关键字，让我们关闭这个再重新部署

this redeploy. If we scroll down to i_owner, screw up the logs,
如果我们向下滚动翻到 i_owner，查看日志调用

we go down to the call, scroll down, we see the execution cost
向下滚动，我们看到执行成本高了很多

was much more. So we'll do the backslash, a seven here, yes, or
所以我们要做斜杠，使用 non-immutable 标记一下

non immutable. So you want to keep some of these tricks in
所以你要记住其中的一些技巧

mind, when it comes to storing variables. The reason that these
当涉及到储存变量的时候，这两种节省 Gas 的原因是

two save gas is because instead of storing these variables
我们不是把这些变量存储在一个存储槽里面

inside of a storage slot, we actually store them directly
而是直接把它们存储到合约的字节码中

into the bytecode of the contract. And like I said, don't
就像我说的，

worry too much about that for now, later on in the course,
现在不要太担心这个问题，在课程的后面

we'll teach you more about storage and a lot of this low
我们会教你更多关于存储和合约的很多低级别的内容

level stuff that comes to these contracts. But for now, just
但现在，只需知道这些存在

know that these exist. And they're nice gas savers, if
如果你只设置一次变量，

you're only setting your variables once.
它们会是很好的节省 Gas 的方式
