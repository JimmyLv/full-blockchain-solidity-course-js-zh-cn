All right, awesome. We have all the basic functionality of our
好，太棒了。我们有了智能合约所需要的所有基本功能
contract that we need here. Now we're finally actually going to
现在我们终于要在测试中运行一切
run everything on a test and see everything happened live before
看到一切在我们眼前发生
our eyes. Are you ready? Let's do this.
你准备好了吗？让我们开始吧
So let's go over to the deploy tab. And we're going to switch
因此，让我们转到部署 Tab
of course to injected web three. Remember But we're using
当然，我们还是切换到 Injected Web3
injected web three, because our price converter dot soul is
记住，但我们使用的是 Injected Web3，因为我们用的 PriceConverter.sol 使用的是
using chainlink Oracle's that actually exist and are actually
使用的是 Chainlink Oracle
monitoring the Rinkeby network for us. Now we're going to
它的存在是为了我们监控 Rinkeby 网络
scroll down to, and we're going to choose the Funmi contract.
现在，让我们向下滚动，选择 FundMe 合约
And we're going to go ahead and deploy. Once again, we want to
我们将继续并部署，再一次
make sure we're on the Rinkeby test net. And we have a little
我们要确保我们是在 Rinkeby 测试网络上
bit of Rinkeby eth in our wallet, let's go ahead and deploy,
我们的钱包里有一点 Rinkeby eth，让我们继续部署，确认
confirm. And we'll wait a little bit. And I'll pull up our log
我们将等待一下。我将在这里调出我们的日志
here. And we'll wait a little bit for our contract to get
我们将等待一下我们的合约被部署
deployed. Alright, great. It looks like our contract has
好的，太好了。看起来我们的合约确实已经部署好了
indeed been deployed. If we scroll down, we can see all of
如果我们向下滚动，我们可以看到我们所有的功能
our functionality, minimum USD is going to be that $50. But
最低美元将是 50 美元
with 18 zeros so that the units are the same as AEtherium, the
但是有 18 个 0，这样单位就和以太坊一样了
owner of our contract was set to our address, the instant we
合约的所有者被设置为我们的地址
deployed this contract, it was deployed by calling our
在我们部署这个合约的瞬间，它是通过调用我们的构造函数部署的
constructor function. So this address 0x1066 is going to be
因此，这个地址 0x1066 将与我们的 MetaMask 中的地址相同
the same as the address in our meta mask, your address here, of
当然，你的地址
course, is going to be a little bit different than mine, we have
在这里将与我的地址有一点不同
our funders array, which, of course is going to be blank, we
我们有我们的 funders 数组，当然，它将是空白的
have our address array, which is also going to be blank. And then
我们有我们的 address 数组，也将是空白的
we have two functions that we can use to modify the state of
然后我们有两个函数，我们可以用来修改区块链上的状态
the blockchain withdraw is going to be orange, because we're not
withdraw() 这个按钮将是橙色的，因为
paying any AEtherium we're actually gaining AEtherium or
我们没有支付任何以太坊，我们实际上正在获得以太坊
whatever native blockchain currency fund is going to be
或任何原生区块链货币，fund() 将是红色的按钮
read, because fun is a payable function that we are going to be
因为 fund() 是一个可支付的函数
sending AEtherium to or sending whatever native blockchain
我们将发送以太坊或发送你正在使用的任何本地区块链货币
currency that you're working with. So let's go ahead and see
因此，让我们继续前进，看看这一切是如何运作的
how this all works. So first, let's go ahead and fund this
因此，首先，让我们继续为这个合约提供资金
contract. Again, funding, we got to do a little bit of math,
同样，要提供资金，我们得做一点数学运算
right now, since the price of eth is around $3,000. And we're
现在，因为 eth 的价格是 3000 美元左右。而我们正在寻找最低 50 美元
looking for $50. Minimum, we do 50 divided by 3000. We can do
我们需要用 50 除以 3000
3000 divided by 50, we can do 50 divided by 3000. So we know that
我们可以做 50 除以 3000，所以我们知道
around 0.02 AEtherium, should be enough for this contract to
大约 0.02 个以太坊，应该足以让这个合约运作
work. So 0.02 AEtherium is this much way, we can copy that,
所以 0.02 以太坊是这么多，我们可以复制，粘贴到这里
paste that into here. So when we hit fund, it should actually
因此，当我们点击 fund 时，它应该真的通过
pass. And we do indeed see meta masks pop up. And we'll go ahead
而且我们确实看到 MetaMasks 弹出，我们将继续并确认
and confirm. Once this transaction goes through, we'll
一旦这个交易通过
be able to see this contract on Ether scan with the funds in it.
我们就能看到这个合约在以太坊上扫描，里面有了资金
Now if we don't add way here, if we don't add a value, once
现在，如果我们不在这里添加方式，如果我们不添加一个值
again, we had fund will say Gas estimation failed because we're
再一次，fund() 将会说 Gas 预估失败
not sending enough here. And in fact, we even see execution
因为我们在这里没有发送足够的 Gas，事实上，我们甚至看到
reverted didn't send enough, we can absolutely send this
"execution reverted: Didn't send enough!" （执行被退回，没有发送足够）
transaction however, it's going to fail. Great. So now that our
我们当然可以发送这个交易，但是，它将会失败。很好。
transaction has gone through, if we go on to the rink the Ether
所以，现在我们的交易已经通过了，如果我们继续到 Rinkeby 的 Etherscan
scan, once we wait a little bit for it to finish indexing here
我们需要稍作等待，一旦它在 Rinkeby 的 Etherscan 上完成索引
on the Rinkeby Ether scan, we can see that transaction
我们可以看到该交易实际上已经通过了资金
actually went through for doing the funding, we can actually see
我们实际上也可以看到
a lot of different details going on with this transaction as
很多不同的细节在这个交易上进行
well. And if we scroll down, we once again, you can see all the
如果我们向下滚动，我们再一次，
information about us calling this fun function, Gas limit
你可以看到关于我们调用 fund 方法的所有信息
Gas, you should the Gas fees, Gas price, and we can see the
包括：Gas limit, Gas usage, Gas feed, Gas price
input data as well, we can see that we called the fund function
我们也可以看到 input data 输入数据
down here. We'll learn more about the input data later. If
我们可以看到我们在这里调用了 fund 方法，我们稍后将了解更多关于输入数据的信息
we go to the contract that we deployed, we can now see two
如果我们去看我们部署的合约，我们现在可以看到两个交易
transactions, we can see our contract created transaction.
我们可以看到我们的合约创建的交易
And we can also see we called a fund method. And if we look at
我们还可以看到我们调用了一个 fund() 方法
the balance of our contract, and now has 0.02 Ether, which makes
如果我们看一下我们合约的余额，现在有 0.02 个 Ether
sense, since we just sent it 0.02. If we put that 0.02 eth
这很合理，因为我们刚刚给它发送了 0.02
in terms of way back into the value section, and we call font
如果我们把这个 0.02 的以太坊放回 Value 部分，并再次调用 fund
again, after this transaction goes through, we should see this
在这个交易进行后，我们应该看到这个数字从 0.02 变成 0.04
number go from 0.02 to 0.04. Now after we wait a brief delay, we
现在，在我们等待一个短暂的延迟之后
do indeed see the balance has gone up to 0.04, which is
我们确实看到余额已经上升到了 0.04
exactly what we'd expect. Awesome. So our funding
这正是我们所期望的，真棒
mechanism is working correctly. And if we go down into our
所以我们的资助机制正在正常工作
array, and our mapping
如果我们进入我们的数组，和我们的映射做地址到数组
to do address to array, and we paste our address, we should see
并且我们粘贴我们的地址，我们应该看到电话号码显示出来
the phone number show up. And if we go to funders of zero, we see
如果我们去找 0 的 funders，我们会看到我们的地址
our address. And if we go to funders of one, we also see our
如果我们转到 founders 1，我们也会看到我们的地址
address and we see that and we see this call going through if
我们还会看到这个调用通过了
we go to funders have to in our log over here, we actually see
如果我们查看 funders 2，在这里的日志中实际上会得到一个错误
that we get an error an optimization that we could make
我们可以在未来对我们的合约进行优化
to our contract in the future is to check to see if an address is
检查一个地址是否已经在 funders 数组中
already in the funders array and then not add it if it's already
如果已经在那里，就不添加它
there. Now let's go ahead and try to call this withdrawal
现在让我们继续尝试调用这个 withdraw 函数
function. But let's try to call it with a different address than
但让我们尝试用一个不同的地址来调用它
the address we originally deployed this contract with. So
而不是与我们最初部署这个合约的地址
to do that, scroll all the way to the top of this here. And I'm
所以要做到这一点，请一路滚动到这里的顶部。
going to go to my Metamask. And I'm going to switch to a second
我将进入我的 Metamask，我将切换到第二个账户
account and hit connect. Now, our remixes should be updated
然后点击连接。现在，我们的 Remix 应该与这里的新账户一起更新
with the new account that's in here, you'll see that if I
你会看到
switch back to account one, it switches back to account one, so
如果我切换回账户 1，它就会切换回账户 1
long as they're both connected, you can see which accounts are
只要它们都是连接的
connected to applications by clicking this connected button
你可以通过点击这个连接的按钮
and see which ones are connected. If you ever want to
看到哪些账户是连接到应用程序的
disconnect that account, you can click the three little dots and
如果你想断开这个账户的连接，你可以点击三个小点
it disconnect the account. And now we can see that this account
它就会断开这个账户的连接，现在我们可以看到
is not connected. However, count two is connected. Let's go back
这个账户不再连接了。然而，账号 2 是连接的
to account one and Connect account one so that both of them
让我们回到账户 1，连接账户 1，这样它们两个现在都连接了
are now connected. But we'll switch to account two, let's
但我们要切换到账户 2，让我们切换到账户 2
switch to account two, because again, account two isn't the
因为再次，账户 2 不是这个合约的所有者
owner of this contract. We scroll down to owner, we can see
我们向下滚动到所有者，我们可以看到所有者的地址是 0x1066 开头
owner's 0x 1066 Something something and account two is
而账户 2 是 0x043 开头
0x 043. Something something awesome. So what do you think
棒极了。那么，你认为当我们在这里点击 withdraw 时会发生什么？
will happen when we hit withdraw here? Well, our modifier only
好吧，我们的函数修饰符 onlyOwner 设置只有所有者才能启动
owner should kick in. And we should get notified that if we
而且我们应该得到通知，如果我们发送交易，我们会得到这个错误
send the transaction, we'll get this error sender is not owner.
"Sender is not owner!" （发送者不是所有者！）
So let's try it. Ah Gas estimation failed, we do get
所以，让我们试试吧。啊，"Gas estimation failed" （Gas 预估失败了）
this error. Sender is not owner, which is perfect. This is
我们确实得到这个错误："Sender is not owner!" （发送者不是所有者），这很完美
exactly what we want, we could absolutely send this transaction
这正是我们想要的，如果我们想，我们完全可以发送这个交易
if we wanted to. But that would just be a waste of Gas because
但那只是在浪费 Gas
this transaction is going to fail. However, if we switch back
因为这个交易会失败
to account one, and we hit withdraw, meta mask will pop up,
然而，如果我们切换回账户 1，并点击提款，MetaMask 将弹出
enabling us to confirm and withdraw the Ether out of this
使我们能够确认并从这个合同地址中提取 Ether
contract address. Now if we look at this contract address on
现在，如果我们在 Etherscan 上看这个合约地址
Etherscan, after a brief delay, we'll see the balance go from
经过短暂的延迟，我们会看到余额从 0.04 回落到 0
0.04 back down to zero. And we'll see our wallet balance go
我们会看到我们的钱包余额
up from what it is back to 0.04 plus what it was. And after a
从原来的数值增加到了原来的金额再加上 0.04
brief delay, you can see our balance is indeed back down to
经过短暂的延迟，你可以看到我们的余额确实回到了合同中的 0
zero in our contract. Now, if we do address to amount for our
现在，如果我们将我们的钱包地址做为资助的地址
wallet address that was doing the funding, it's back down to
它又回到了 0
zero. And if we try to check the address of funders at index
而如果我们试图检查索引为 0 的 funder 地址
zero, we get called to funders that fund me errored execution
我们会被告知一个调用失败的错误："call to FundMe.funders errored: execution reverted"
reverted.
