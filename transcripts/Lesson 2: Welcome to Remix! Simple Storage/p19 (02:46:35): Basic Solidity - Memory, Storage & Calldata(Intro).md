([02:46:35](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=9995s)): Basic Solidity - Memory, Storage & Calldata(Intro)

So one thing that you'll notice here is that we have this memory keyword. And you'll notice if you try to delete it from our function here, you try to compile, you actually run into an error: Data location must be "memory" or "calldata" for parameter in function.

Now there are actually six places you can store data in Solidity. You have the Stack, Memory, Storage, Calldata, Code and Logs. We're not going to go over these right now. But we are going to focus on three of the big ones, or three of the important ones for this section, which are calldata, memory, and storage. 

So for this section, we're going to talk about calldata memory and storage. And this is a little bit advanced. So if you don't totally grasp it the first time, that's totally okay. Please continue even if it's not crystal clear what's going on here.

calldata and memory mean that the variable is only going to exist temporarily. So this name variable only exists temporarily during the transaction that this addPerson function is called.

storage variables exist even outside of just the function executing. Even though we didn't specify it up above, our favorite number is automatically cast to be a storage variable. Since it's not explicitly defined in one of these functions. 

Since we don't need this name variable anymore after this function runs, we can keep it as memory, or we could keep it as calldata, you can have a parameter as calldata if you don't end up modifying the name. 

For example, we couldn't reassign name to equal "cat" here, if we compile we run into an error: `Type literal string "cat" is not implicitly convertible to expect the type string calldata`. 

However, if we have this as memory, and we compile and save it, that error goes away. 

calldata is temporary variables that can't be modified. memory is temporary variables that can be modified. And storage is permanent variables that can be modified. 

Now even though I just said there's actually six places where we can access and store information, we cannot say a variable is Stack, Code or Logs, we can only say Memory, Storage or Calldata, you will learn why in a much later section. 

Now, this is a bit of an oversimplification of this. But that's essentially what's going on. 

The next question you might have is, well, why do I need to say memory here, but I don't need to say memory here. Well, let's go ahead and put memory here and hit CTRL+S or compile. 

And let's see what happens we get from Solidity: `Data location can only be specified for an array, struct or mapping types, but "memory" was given arrays structs and mappings are considered special types and Solidity`. 

Solidity automatically knows where are you uint256 is going to be. Solidity knows that for this function, uint256 is going to live just in memory. 

However, it's not sure what a string is going to be. Strings are actually kind of complicated. 

Behind the scenes, a string is actually an array of bytes. And since a string is an array, we need to add this memory bit to it because we need to tell Solidity, the data location of arrays structs, or mappings and a string is secretly an array. 

So that's why we need to tell it it's in memory. 

You'll notice we can't add the storage keyword here, Solidity also knows that since this is a function, this name variable isn't actually getting stored anywhere. 

So it says Hey, you can't have that you need to have it beat memory or calldata and those are the only two that it accepts. So this is what we want our function to look like here. 

So the summary of this is struct mappings and arrays need to be given this memory or calldata keyword when adding them as a parameter to different functions. 

We'll learn more about storage memory and calldata in later sessions.
