Now let's look at one more way to improve this contract.
现在让我们再看看改进这个合约的另一个方法

Sometimes people will try to interact with the contract that
有时人们会试图与 Ethereum

takes Ethereum or the native blockchain token without
或原生区块链代币的智能合约进行交互

actually going through the required function calls that
而不去执行实际所需的函数调用

that are needed. For example, on a JavaScript EVM here, I could
例如，在这里的 JavaScript EVM 上，

actually try to send this contract money without calling
我实际上可以尝试在不调用 fund 函数的情况下向这个合约发送资金

the fund function. However, if I were to do that, what would
然而，如果我这样做的话，

happen with our fund function get triggered? No, it wouldn't
这时会对我们的 fund 函数产生什么作用吗？不，它不会被触发

get triggered, we wouldn't keep track of that funder, we
我们将无法跟踪那个 funder

wouldn't have that person's information updated in this
我们不会在这个合约中更新那个人的信息

contract. So if later on we want to give rewards or something we
因此，如果以后我们想给予奖励或什么

wouldn't know about those funders. And this wouldn't be
我们就不知道这些 funder 的情况

great because people would send our contract money without us
这就不妙了，因为人们会在我们不知道的情况下给我们的合约送钱

ever knowing and we wouldn't be able to give them any credit or
我们就不能给他们任何凭证或其他东西

anything. Additionally, maybe they called the wrong function
此外，也许他们意外地调用了错误的函数

by accident, and they they weren't using MetaMask. And they
比如他们没有使用 MetaMask 钱包，

weren't using a tool to tell them, hey, this transaction is
他们也没有使用一个工具来告诉他们，嘿，这个交易很可能会失败

likely going to fail. So what can we do in this case? What
那么，在这种情况下我们能做什么呢？

happens if someone sends this contract, Ether without calling
如果有人在没有调用 fund 函数的情况下给这个合约发送 ETH 以太币

the fun function? Right now, if we were to send this FundMe
会发生什么呢？

contract ETH, it would just go to the contract. Right, and this
现在，如果我们要发送这个 FundMe 合约发送 ETH，它会直接转到合约，对吧？

contract just wouldn't keep track of those people. But
这个合约不会记录这些人的情况

there's actually a way for when people send money to this
但是实际上有一种方法，当人们给这个合约转钱

contract, or people call a function that doesn't exist for
或者人们调用一个不存在的函数

us to still trigger some code. And now there are two special
我们仍然可以触发合约的一些代码

functions in Solidity one is called receive, and one is
而现在在 Solidity 中有两个特殊的函数一个叫做 receive，一个叫做 fallback

called the fallback. Now in Solidity, there are actually a
现在在 Solidity 中，实际上有很多特殊的函数

number of special functions and two of these special functions
其中有两个特殊的函数是 receive 特殊函数

are the receive special function. And the fallback
和 fallback 特殊函数

special function, a contract can have at most one receive
一个合约最多可以有一个使用 receive 外部支付的 receive 函数

function declared using the received external payable.
使用 receive() external payable {} 来作为声明

Without the function keyword. This function cannot have
这个函数不能有参数不能返回任何东西，

arguments cannot return anything and must have external
必须有外部可见性，

visibility, and a payable state mutability. What does that
以及一个应付状态的可变性

actually mean? And or look like? Well, let's create a separate
这实际上是什么意思呢？或者说看起来像什么？

contract to go ahead and play with this. So in here, we're
好吧，让我们创建一个单独的合约来继续玩一玩这个

going to create a new file called fallback example, dot
所以，在这里，我们要创建一个新的文件，叫做 FallbackExample.sol

soul. And in here, we're going to add our basic pieces, SPX
在这里，我们要添加我们的基本部分，SPX 许可证标识符

license identifier, MIT pragma, Solidity zero, point 8.7. And
添加 // SPDX-License-Identifier: MIT 和 Solidity 版本

we'll do contract fallback example, like so, feel free to
我们将做合约回退的例子，就像这样 contract FallbackExample {}

pause the video to catch up to this point. once we create our
请随意暂停视频，动手敲代码赶上我

fallback contract, let's create a variable to go ahead and try
一旦创建好了我们的 fallback 合约，让我们创建一个变量

to test this function, we'll create a un 256 public result
来继续尝试测试这个函数，我们将创建一个 uint256 public result 变量

variable. And let's create this receive function. So we'll say
让我们创建这个 receive 函数

receive, it's going to be an external payable.
所以我们会说 receive，它将是一个外部可支付的函数方法

function, we don't add the function keyword for receive,
我们不需要为 receive 添加函数关键字

since Solidity knows that receive is a special function
因为 Solidity 知道，只要我们发送 Ethereum 或向这个合约进行交易，

whenever we send Ethereum or make a transaction to this
receive 就是一个特殊的函数

contract. Now, as long as there's no data associated with
现在，只要没有与该交易相关的数据

that transaction, this receive function will get triggered.
这个 receive 函数就会被触发

What we can do in here now is we can say result equals one. So
我们现在可以在这里做的是，我们可以说 result = 1;

let's go ahead and test this out on the JavaScript virtual
所以，让我们继续在 JavaScript 虚拟机上测试这个，

machine, we compile this, so we're gonna go ahead and compile
我们编译这个，所以我们要继续编译这个

this. And we'll go deploy it on the Java Virtual Machine, we're
我们将在 Java 虚拟机上部署它，

going to deploy our fallback example. And we're going to see
我们将部署我们的 FallbackExample

what result is initialized to, since we haven't set anything
我们将看到 result 被初始化成什么，因为我们没有为 result 设置任何东西

for result, result, of course, is initialized zero. But what if
result 当然是被初始化为 0

we were to send this contract some Ethereum? Well receive
但如果我们向这个合约发送一些以太坊呢？

would go ahead and be triggered here, we can actually send this
好吧，receive 将继续进行并在这里被触发

contract some material directly by working with this low level
我们实际上可以通过与这个低级别的交互工作，直接向这个合约发送一些材料

interactions. But here, don't worry about what call data means
但是在这里，暂时不要担心 calldata 的含义

for now, just know that this area down here is a way we can
只需要知道下面这个区域

send and work with different functions. And we can add
是我们可以发送和处理不同功能的一种方式

parameters to this transaction, by going here and adjusting
而且我们可以在这个交易中添加参数，通过这里去调整上面的变量

the variables up here. If we keep called Data blank, it'll be
如果我们保持 calldata 留空，

the same as if we were in MetaMask. And just hitting send
它将与我们在 MetaMask 中的情况相同

in the choosing this contract address. Again, we can't
然后在选择这个合约地址时点击发送

actually use MetaMask, since this is a virtual machine, and
同样，我们实际上不能使用 MetaMask，因为这是一个虚拟机

not one of the networks that we're working with. So if I do,
而不是我们正在工作的网络之一

for example, I change this value to one way, and I keep
因此，如果我这样做，例如，我把这个值改为 1 Wei，并保持一切空白

everything blank. And I go ahead and hit this transaction button,
我继续前进，点击这个交易按钮，

which again, is going to be the same as hitting this Send
同样，这将与点击这个发送按钮一样，但只发送 1 Wei

button, but only sending one way. What do you think will
你认为会发生什么？

happen? Well, let's try it. We can see in the log area that we
好吧，让我们来试试

did indeed send a transaction. And if you look at the
我们可以在日志区看到，我们确实发送了一个交易

description here, you can even see it says from so and so to
如果你看一下这里的描述，你甚至可以看到它说发送自 0xxx 地址

fall back example, dot receive, it looks like it called our
到了我们的 FallbackExample.(receive)，看起来它调用了我们的 receive 函数

received function, which should have updated our result to one.
这应该把我们的 result 更新为 1

So if we hit result, now we can indeed see that result has been
因此，如果我们点击 result，现在我们确实可以看到 result 已经被更新为 1 的值

updated to the value of one. Well, let's go ahead and delete
好吧，让我们继续下去，删除这个

this. Let's deploy this contract again. And this time, let's have
让我们再次部署这个合约

this value be zero, does receive get triggered this time. So
这一次，让我们把这个值设为 0，这次会不会被触发

let's pull this down. Let's hit transact. Let's leave the call
所以让我们把这个拉下来，点击交易

data blank, we'll leave value at zero. So this will be the same
让我们把 calldata 留空，我们把值留为 0

as if we had sent zero Ethereum to this contract. Let's hit
因此，这将与我们向该合约发送 0 个 ETH 的情况相同，点击交易

transact. It looks like that went through, do you think
看起来已经通过了，你认为 result 会是 1 还是 0？

result is going to be one or zero? You thought one you were
你认为是 1？

correct or receive function gets triggered anytime we send a
你是正确的，或者说，现在我们向这个合约发送交易的时候

transaction to this contract now, and we don't specify a
当我们没有指定一个函数，receive 函数就会被触发

function. And we keep the call data blank when working with any
而我们在与任何其他合约如 FundMe 合作时，保持 calldata 空白

other contract like FundMe. For example, when we call one of
例如，当我们调用这些函数之一时

these functions, we're actually just populating this call data
我们实际上只是用某些数据来填充这个 calldata

bit with certain data that points to one of these functions
这些数据指向这里的这些函数之一

up here. If we send a transaction and we add data to
如果我们发送一个交易并向其添加数据，

it, we could actually call one of these functions. Now let's
我们实际上可以调用这些函数中的一个

try this again. Let's delete the contract again we'll redeploy
现在让我们再试一下，让我们再次删除合约，我们将重新部署

open this up result is currently zero receive like I said only is
打开这个，result 目前是 0

triggered if our call data to it is blank. Now this time if I had
receive，就像我说的，只有当我们对它的 calldata 是空白时才会被触发

some call data to this transaction, do you think
现在，如果我对这个交易有一些 calldata ，你认为这次 receive 会被触发吗？

receive will be triggered this time? If we hit transact and
如果我们点击 transact

remix we actually get a pop up saying fallback function is not
Remix 实际上会弹出一个窗口，说 'Fallback' function is not defined

defined. This is because whenever data is sent with a
这是因为每当数据与交易一起被发送时，

transaction Solidity says, Oh, well, since you're sending data
Solidity 会说，哦，好吧，既然你在发送数据，

you're not looking for receive, you're looking for some
你不是在寻找 receive，你是在寻找一些函数

function. So let me look for that function for you. Hmm, I
所以让我为你寻找那个函数

don't see any function that matches the 0x 00. So I'm going
嗯，我没有看到任何符合 0x00 的函数

to look for your fallback function. Remix is smart enough
所以我要去找你的 fallback 函数

to know that we don't have a fallback function. The second
Remix 很聪明，知道我们没有 fallback 函数

special function in Solidity is called the fallback function.
Solidity 中的第二个特殊函数被称为 fallback 函数

This is very similar to the receive function, except for the
它与 receive 函数非常相似，不同的是，

fact that can work even when data is sent along with
即使数据与交易一起被发送，它也能发挥作用

transaction. So our fallback will look something like this
因此，我们的 fallback 函数将看起来像这样的回调 fallback() external payable{}

fallback external payable. result equals two. Fallback is another one of
result = 2; fallback 是这些函数中的另一个

these functions where we're not going to put the function
我们不打算把函数选择器放在这里

selector because Solidity is expecting this, actually, you're
因为 Solidity 正在期待这个

already familiar with one other special function, we go back to
实际上，你已经熟悉了另外一个特殊的函数，我们回到我们的 FundMe 合约

our FundMe. Our constructor, for example, is a another type of
例如，我们的构造函数，是另一种类型的特殊函数

special function. There's no function keyword. Solidity knows
没有函数关键字

that this constructor is immediately called when we
Solidity 知道，当我们部署这个合约时，这个构造函数会被立即调用

deploy this contract. So now we have our fallback function.
所以现在我们有了我们的 fallback 函数

Let's go ahead and compile this. Let's delete our old contract.
让我们继续并编译这个，删除我们的旧合约

Let's go ahead and deploy this new contract. Like here, we hit
让我们继续前进，部署这个新的合约

result, we do indeed, see, it's set to zero. Now, if I add this
就像这里，我们点击 result，我们确实做到了，看，它被设置为 0

0x 00, and I send this, and I hit transact, this is equivalent
现在，如果我添加这个 0x00，然后我发送这个，然后我点击 Transact

to calling our contract here without a valid function. So our
这相当于在这里调用我们的合约，而没有一个有效的函数

contract goes, Huh, I don't recognize what you're trying to
所以我们的合约会说："哼，我不知道你想告诉我什么，

tell me here, I'm going to refer you to our fallback. And now if
我要把你转到我们的 fallback 程序"

we hit result, we see that it's been updated to two. If we take
现在，如果我们点击 result，我们看到它已经被更新为 2

this away, Solidity will go, Hmm, it looks like you're trying
如果我们把这个拿开，Solidity 会说，嗯，看起来你想发送一些以太坊，

to send some Ethereum, or call this contract without specifying
或者在没有指定你想做什么的情况下调用这个合约

what you want to do. Well, I have a receipt function. So I'm
好吧，我有一个 receive 函数

just gonna go ahead and forward you to that. So if we call
所以我只是要继续前进，把你转到那个地方

transact, we hit result, we see it updates back to one, add some
因此，如果我们调用 transact，我们点击 result，我们看到它更新为 1

data, hit transact, we see it updates to to no data, updates
添加一些数据，点击 transact，我们看到它更新为无数据，慢慢地更新为 1

to one slowly by example, that org has a wonderful little chart
例如 solidity-by-example.org 有一个奇妙的小图例

that we can use to figure out whether or not receive is going
我们可以用来计算是否 receive 会被触发，或 Fallback 会被触发

to get triggered, or Fallback is going to get triggered. If it is
如果它是空的，

empty, and there's a receive function, it'll call the receive
并且有一个 receive 函数，它将调用 receive 函数

function. If it is data, and there's no receive function,
如果它是数据，并且没有 receive 函数，

it'll just go to the fallback function. And if there's no
它就会去调用 fallback 函数

fallback function, it might just it might air out. So this is a
如果没有 fallback 函数，它可能就会抛出 error

lot of really fantastic information here. How can we
因此，这里有很多非常棒的信息

apply this to our fund mi contract here, or what we can do
我们如何将其应用于我们的 FundMe 合约，

now in our FundMe is we can add these fallback and receive
或者我们现在可以在 FundMe 中做的就是，添加这些 fallback 和 receive 函数

functions, just in case somebody actually sends us contract money
以防有人向我们发送合约资金，而不是正确调用 fund 函数

instead of calling the fund function correctly. So what we
所以我们可以做的是让我们添加一个 receive 函数

can do is let's add a receive function. So if somebody
因此，如果有人不小心把钱寄给了它，

accidentally sends it money, we can still process the
我们仍然可以处理这个交易，

transaction will say receive is going to be external payable.
会使用 receive() external payable

And we'll just have the receive function call fund. And we'll do
而我们只需让 receive 函数调用 fund 函数

the same thing with our fallback function will have fallback
我们将对我们的 fallback 函数做同样的事情

external payable. We'll just have it automatically call fund.
将使用 fallback() external payable，让它自动调用 fund 函数

Now, if somebody accidentally sends us money without calling
现在，如果有人不小心给我们转钱而不调用我们的 fund 函数

our fund function, it'll still automatically route them over to
它仍然会自动将他们转到 fund 函数

the fund function. This means to that if somebody doesn't send us
这意味着，如果有人没有给我们发送足够的资金，

enough funding, it'll, that transaction will still get
它将，该交易仍将被退回

reverted. So let's go ahead now. And let's switch to rink B to
所以，我们现在继续吧，让我们切换到 Rinkeby，

test this on a real test net, Amman rink B and my MetaMask.
在一个真实的测试网上测试这个，连接 Rinkeby 和我的 MetaMask

Let's switch over to injected web three. And we'll scroll down
让我们切换到 Injected Web3，然后向下滚动，

we'll choose our FundMe contract. And we'll go ahead and deploy
我们将选择我们的 FundMe 合约，继续并部署

this MetaMask pops up, I'm gonna go ahead and confirm the
MetaMask 弹窗，我将继续并确认交易

transaction. And we see our FundMe contract here right now we
我们现在看到我们的 FundMe 合约，我们可以看到所有者，

can see the owner we can see I'm the owner, we can see minimum
我们可以看到我是所有者，我们可以看到 MINIMUM_USD

USD. And we can see of course that it's a blank contract, and
当然，我们可以看到这是一个空白合约，这里没有任何资金

there's nothing funded in here. If we the copy the address, and
如果我们复制这个地址，

then go to rink the Ether scan, paste the address in, we can see
然后进入 Etherscan，粘贴这个地址，

that there's no Ether in here. And the only transaction
我们可以看到这里没有以太币

associated with this has been the contract creation. We saw
而与此相关的唯一交易是创建合约

what happened before when we hit the fun function, our contract
我们看到，当我们点击 fund 函数时，

was updated with a new balance, and that funder was added to our
我们的合约被更新为新的余额，并且那个出资人被添加到我们的数组中

an array. Let's see what happens now if we just directly send
让我们看看现在发生了什么，

this contract money without calling the fund function here.
如果我们不调用 fund 函数而直接向这个合约发送资金

If we did this right, our receive function should pick it
如果我们做得对的话，我们的 receive 函数应该会 receive 到它，

up and kick the transaction over the font. So let's copy this
并将交易转到 fund 函数上

address. We'll go to our meta mask. We'll hit send, paste the
所以让我们复制这个地址，我们将去我们的 MetaMask

address in here with 0.02 eath. Again, because this should be
我们点击发送，把这个地址粘贴到这里，再加上 0.02 的 ETH

more than the minimum amount in USD, we'll hit next. I'll go
同样，因为这应该超过了美元的最低数额，我们将点击下一步

ahead and confirm this. After a slight delay, if we did this
我将继续并确认这一点，稍微延迟后，如果我们这样做是对的

right, we should see the transaction having called the
我们应该看到交易在这里调用了 fund 函数

fund function here, now that our transaction has gone through
现在我们的交易已经通过了

After a brief delay in waiting for Ethers can update, we do
在等待 Ethers 可以更新的短暂延迟后，

indeed see that our balance has updated to 0.02, which of
我们确实看到我们的余额已经更新为 0.02，

course, this makes sense. And we see in the transactions list
当然，这是讲得通的，我们在交易列表中看到，

here, we see that this actually went through as a, as a transfer
我们看到这实际上是以转账的方式进行的，

instead of us calling the fund function. Let's go ahead and
而不是我们调用 fund 函数

remix and see if our funders was updated.
让我们继续下去，在 Remix 中看看我们的 funders 是否被更新

It looks like it was at the zero with position of funders, we
看起来它是在 0 的位置上，我们有我们的地址

have our address. And if we take our address and pop it into
如果我们把我们的地址放到地址和资金数量之间，

address to amount funded, we can see exactly how much we had
我们就可以看到我们到底有多少资金

funded. This means that since we added this receive function in
这意味着，由于我们在这里添加了这个 receive 函数，

here, we automatically had to call our fun function up here.
我们就自动调用了我们的 fund 函数

So awesome work, we were able to add a receive function to help
因此，了不起的工作，我们能够添加一个 receive 函数，

people who accidentally call the wrong function or accidentally
以帮助那些不小心调用了错误的函数或不小心发送这个合约的钱

send this contract money, instead of correctly calling the
而不是正确地调用 fund 函数的人

fun function. Now, if they had directly called the fun
现在，如果他们直接调用 fund 函数

function, it would have cost them a little bit less gas, but
这会帮助他少花一点 Gas

at least this time, they're gonna get credit and add it to
至少这一次，他们会得到凭证，合约会把它添加到我们的 funder 数组当中

our funders array for having sent our FundMe contract money.
因为他们已经给我们的 FundMe 合约转过钱了
