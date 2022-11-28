Now let's look at one more way to improve this contract.

Sometimes people will try to interact with the contract that

takes Aetherium or the native blockchain token without

actually going through the required function calls that

that are needed. For example, on a JavaScript EVM here, I could

actually try to send this contract money without calling

the fund function. However, if I were to do that, what would

happen with our fund function get triggered? No, it wouldn't

get triggered, we wouldn't keep track of that funder, we

wouldn't have that person's information updated in this

contract. So if later on we want to give rewards or something we

wouldn't know about those funders. And this wouldn't be

great because people would send our contract money without us

ever knowing and we wouldn't be able to give them any credit or

anything. Additionally, maybe they called the wrong function

by accident, and they they weren't using Metamask. And they

weren't using a tool to tell them, hey, this transaction is

likely going to fail. So what can we do in this case? What

happens if someone sends this contract, ether without calling

the fun function? Right now, if we were to send this Funmi

contract, ie it would just go to the contract Right, and this

contract just wouldn't keep track of those people. But

there's actually a way for when people send money to this

contract, or people call a function that doesn't exist for

us to still trigger some code. And now there are two special

functions in solidity one is called receive, and one is

called the fallback. Now in solidity, there are actually a

number of special functions and two of these special functions

are the receive special function. And the fallback

special function, a contract can have at most one receive

function declared using the received external payable.

Without the function keyword. This function cannot have

arguments cannot return anything and must have external

visibility, and a payable state mutability. What does that

actually mean? And or look like? Well, let's create a separate

contract to go ahead and play with this. So in here, we're

going to create a new file called fallback example, dot

soul. And in here, we're going to add our basic pieces, SPX

license identifier, MIT pragma, solidity zero, point 8.7. And

we'll do contract fallback example, like so, feel free to

pause the video to catch up to this point, let's recreate our

fallback contract, let's create a variable to go ahead and try

to test this function, we'll create a un 256 public result

variable. And let's create this receive function. So we'll say

receive, it's going to be an external payable.

function, we don't add the function keyword for receive,

since solidity knows that receive is a special function

whenever we send Aetherium or make a transaction to this

contract. Now, as long as there's no data associated with

that transaction, this receive function will get triggered.

What we can do in here now is we can say result equals one. So

let's go ahead and test this out on the JavaScript virtual

machine, we compile this, so we're gonna go ahead and compile

this. And we'll go deploy it on the Java Virtual Machine, we're

going to deploy our fallback example. And we're going to see

what result is initialized to, since we haven't set anything

for result, result, of course, is initialized zero. But what if

we were to send this contract some Aetherium? Well receive

would go ahead and be triggered here, we can actually send this

contract some material directly by working with this low level

interactions. But here, don't worry about what call data means

for now, just know that this area down here is a way we can

send and work with different functions. And we can add

parameters to this transaction, by going up here and adjusting

the variables up here. If we keep called Data blank, it'll be

the same as if we were in Metamask. And just hitting send

in the choosing this contract address. Again, we can't

actually use Metamask, since this is a virtual machine, and

not one of the networks that we're working with. So if I do,

for example, I change this value to one way, and I keep

everything blank. And I go ahead and hit this transaction button,

which again, is going to be the same as hitting this Send

button, but only sending one way. What do you think will

happen? Well, let's try it. We can see in the log area that we

did indeed send a transaction. And if you look at the

description here, you can even see it says from so and so to

fall back example, dot receive, it looks like it called our

received function, which should have updated our result to one.

So if we hit result, now we can indeed see that result has been

updated to the value of one. Well, let's go ahead and delete

this. Let's deploy this contract again. And this time, let's have

this value be zero, does receive get triggered this time. So

let's pull this down. Let's hit transact. Let's leave the call

data blank, we'll leave value at zero. So this will be the same

as if we had sent zero Aetherium to this contract. Let's hit

transact. It looks like that went through, do you think

result is going to be one or zero? You thought one you were

correct or receive function gets triggered anytime we send a

transaction to this contract now, and we don't specify a

function. And we keep the call data blank when working with any

other contract like Funmi. For example, when we call one of

these functions, we're actually just populating this call data

bit with certain data that points to one of these functions

up here. If we send a transaction and we add data to

it, we could actually call one of these functions. Now let's

try this again. Let's delete the contract again we'll redeploy

open this up result is currently zero receive like I said only is

triggered if our call data to it is blank. Now this time if I had

some call data to this transaction, do you think

receive will be triggered this time? If we hit transact and

remix we actually get a pop up saying fallback function is not

defined. This is because whenever data is sent with a

transaction solidity says, Oh, well, since you're sending data

you're not looking for receive, you're looking for some

function. So let me look for that function for you. Hmm, I

don't see any function that matches the 0x 00. So I'm going

to look for your fallback function. Remix is smart enough

to know that we don't have a fallback function. The second

special function in solidity is called the fallback function.

This is very similar to the receive function, except for the

fact that can work even when data is sent along with

transaction. So our fallback will look something like this

callback,

external payable. result equals to Fallback is another one of

these functions where we're not going to put the function

selector because solidity is expecting this, actually, you're

already familiar with one other special function, we go back to

our Funmi. Our constructor, for example, is a another type of

special function. There's no function keyword. solidity knows

that this constructor is immediately called when we

deploy this contract. So now we have our fallback function.

Let's go ahead and compile this. Let's delete our old contract.

Let's go ahead and deploy this new contract. Like here, we hit

result, we do indeed, see, it's set to zero. Now, if I add this

0x 00, and I send this, and I hit transact, this is equivalent

to calling our contract here without a valid function. So our

contract goes, Huh, I don't recognize what you're trying to

tell me here, I'm going to refer you to our fallback. And now if

we hit result, we see that it's been updated to two. If we take

this away, solidity will go, Hmm, it looks like you're trying

to send some Aetherium, or call this contract without specifying

what you want to do. Well, I have a receipt function. So I'm

just gonna go ahead and forward you to that. So if we call

transact, we hit result, we see it updates back to one, add some

data, hit transact, we see it updates to to no data, updates

to one slowly by example, that org has a wonderful little chart

that we can use to figure out whether or not receive is going

to get triggered, or Fallback is going to get triggered. If it is

empty, and there's a receive function, it'll call the receive

function. If it is data, and there's no receive function,

it'll just go to the fallback function. And if there's no

fallback function, it might just it might air out. So this is a

lot of really fantastic information here. How can we

apply this to our fund mi contract here, or what we can do

now in our Funmi is we can add these fallback and receive

functions, just in case somebody actually sends us contract money

instead of calling the fund function correctly. So what we

can do is let's add a receive function. So if somebody

accidentally sends it money, we can still process the

transaction will say receive is going to be external payable.

And we'll just have the receive function call fund. And we'll do

the same thing with our fallback function will have fallback

external payable. We'll just have it automatically call fund.

Now, if somebody accidentally sends us money without calling

our fund function, it'll still automatically route them over to

the fund function. This means to that if somebody doesn't send us

enough funding, it'll, that transaction will still get

reverted. So let's go ahead now. And let's switch to rink B to

test this on a real test net, Amman rink B and my Metamask.

Let's switch over to injected web three. And we'll scroll down

we'll choose our Funmi contract. And we'll go ahead and deploy

this Metamask pops up, I'm gonna go ahead and confirm the

transaction. And we see our Funmi contract here right now we

can see the owner we can see I'm the owner, we can see minimum

USD. And we can see of course that it's a blank contract, and

there's nothing funded in here. If we the copy the address, and

then go to rink the ether scan, paste the address in, we can see

that there's no ether in here. And the only transaction

associated with this has been the contract creation. We saw

what happened before when we hit the fun function, our contract

was updated with a new balance, and that funder was added to our

an array. Let's see what happens now if we just directly send

this contract money without calling the fund function here.

If we did this right, our receive function should pick it

up and kick the transaction over the font. So let's copy this

address. We'll go to our meta mask. We'll hit send, paste the

address in here with 0.02 eath. Again, because this should be

more than the minimum amount in USD, we'll hit next. I'll go

ahead and confirm this. After a slight delay, if we did this

right, we should see the transaction having called the

fund function here, now that our transaction has gone through

After a brief delay in waiting for ethers can update, we do

indeed see that our balance has updated to 0.02, which of

course, this makes sense. And we see in the transactions list

here, we see that this actually went through as a, as a transfer

instead of us calling the fund function. Let's go ahead and

remix and see if our funders was updated.

It looks like it was at the zero with position of funders, we

have our address. And if we take our address and pop it into

address to amount funded, we can see exactly how much we had

funded. This means that since we added this receive function in

here, we automatically had to call our fun function up here.

So awesome work, we were able to add a receive function to help

people who accidentally call the wrong function or accidentally

send this contract money, instead of correctly calling the

fun function. Now, if they had directly called the fun

function, it would have cost them a little bit less gas, but

at least this time, they're gonna get credit and add it to

our funders array for having sent our funding contract money.
