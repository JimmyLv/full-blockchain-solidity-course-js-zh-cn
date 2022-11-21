所以，你会注意到的一件事是，我们有这个 memory 关键字。你会发现，如果你试图从这里的函数中删除它，尝试编译，实际上会遇到一个错误：`函数参数的数据位置（Data location）必须是 "memory "或 "calldata"`。

目前，在 Solidity 中有 6 种方式可以存储数据。你有 Stack、Memory、Storage、Calldata、Code 和 Logs。我们现在不打算去介绍所有的这些，但会专注于讲解其中的三个最大的，或者说本节的三个最重要的，那就是 Calldata, Memory 和 Storage。

因此，在这一节中，我们要谈的是 calldata, memory 和 storage。这是一个稍微进阶的知识点。所以，如果你第一次没有完全掌握它，那也完全没关系。即使不清楚这里发生了什么，也请继续学习。

calldata 和 memory 意味着这个变量只是暂时存在。所以这个 \_name 变量仅在调用此 addPerson() 函数的 transaction 交易期间暂时存在。

存储变量甚至存在于正在执行的函数之外。尽管我们在上面没有指定它，但我们的 favoriteNumber 被自动分配为一个存储变量，因为它没有在这些函数中明确定义。

因为在这个函数运行后，我们就不再需要这个 \_name 变量了，我们可以把它作为 memory，也可以把它作为 calldata。如果你最终不修改这个名字，你可以把一个参数作为 calldata。

例如，我们不能在这里把名字改成等于 "cat"，如果编译的话会遇到一个错误：`类型字面字符串 "cat" 不能隐式转换为预期的类型字符串calldata`。

然而，如果我们把这个作为 memory，并编译和保存它，这个错误就会消失。

所以，calldata 是不能被修改的临时变量。 memory 是可以被修改的临时变量。而 storage 是可以被修改的永久变量。

现在，尽管我刚才说实际上有 6 个地方可以让我们访问和存储信息，但我们不能说一个变量是 Stack、Code 或 Logs，我们只能说是 Memory、Storage 或 Calldata，你将在更后面的章节中了解原因。

现在，这是有点过于简单化了，但这基本上就是可以工作的情况。

你可能会有下一个问题，好吧，为什么我需要在这里说 memory，但我不需要在这里说 memory 呢？好吧，让我们继续前进，把 memory 放在这里，然后点击 CTRL+S 或者编译。

让我们看看从 Solidity 得到的结果：`数据位置只能指定给数组、结构或映射类型，但给到的却是 "memory"`。

这是因为数组、结构和映射在 Solidity 中被认为是特殊的类型，而 Solidity 可以自动知道 uint256 的位置。Solidity 知道，对于这个函数，uint256 将仅仅存在于内存中。

然而，它不确定 string 会是什么。string 实际上是有点复杂的。

从背后原理上来说，一个 string 实际上是一个 bytes 数组。由于 string 是一个数组，我们需要把这个 memory 字节加进去。因为我们需要让 Solidity 知道，数组、结构或映射的数据位置。

而 string 背后其实是一个数组。所以这就是为什么我们需要告诉它，它是在 memory 内存中的。

你会注意到我们不能在这里添加 storage 关键字，Solidity 也知道由于这是一个函数，这个名字变量实际上并没有被存储到任何地方。

所以它说，嘿，你不能有这个。你需要让它成为 memory 或 calldata，这是它唯一接受的两种类型。所以这就是我们希望我们的函数看起来像是这样的。

所以，总结一下，结构体，映射和数组在作为参数被添加到不同的函数时，需要给定一个 memory 或 calldata 关键词。

我们将在以后的课程中学习更多关于存储 memory 和 calldata 的知识。

---

([02:46:35](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=9995s)): Basic Solidity - Memory, Storage & Calldata(Intro)

So one thing that you'll notice here is that we have this memory keyword. And you'll notice if you try to delete it from our function here, you try to compile, you actually run into an error: Data location must be "memory" or "calldata" for parameter in function.

Now there are actually six places you can store data in Solidity. You have the Stack, Memory, Storage, Calldata, Code and Logs. We're not going to go over these right now. But we are going to focus on three of the big ones, or three of the important ones for this section, which are calldata, memory, and storage.

So for this section, we're going to talk about calldata, memory and storage. And this is a little bit advanced. So if you don't totally grasp it the first time, that's totally okay. Please continue even if it's not crystal clear what's going on here.

calldata and memory mean that the variable is only going to exist temporarily. So this name variable only exists temporarily during the transaction that this addPerson() function is called.

storage variables exist even outside of just the function executing. Even though we didn't specify it up above, our favoriteNumber is automatically cast to be a storage variable since it's not explicitly defined in one of these functions.

Since we don't need this name variable anymore after this function runs, we can keep it as memory, or we could keep it as calldata, you can have a parameter as calldata if you don't end up modifying the name.

For example, we couldn't reassign name to equal "cat" here, if we compile we run into an error: `Type literal string "cat" is not implicitly convertible to expected the type string calldata`.

However, if we have this as memory, and we compile and save it, that error goes away.

calldata is temporary variables that can't be modified. memory is temporary variables that can be modified. And storage is permanent variables that can be modified.

Now even though I just said there's actually six places where we can access and store information, we cannot say a variable is Stack, Code or Logs, we can only say Memory, Storage or Calldata, you will learn why in a much later section.

Now, this is a bit of an oversimplification of this. But that's essentially what's going on.

The next question you might have is, well, why do I need to say memory here, but I don't need to say memory here. Well, let's go ahead and put memory here and hit CTRL+S or compile.

And let's see what happens we get from Solidity: `Data location can only be specified for an array, struct or mapping types, but "memory" was given`

Arrays, structs and mappings are considered special types in Solidity, Solidity automatically knows where uint256 is going to be. Solidity knows that for this function, uint256 is going to live just in memory.

However, it's not sure what a string is going to be. Strings are actually kind of complicated.

Behind the scenes, a string is actually an array of bytes. And since a string is an array, we need to add this memory byte to it because we need to tell Solidity, the data location of arrays, structs, or mappings.

And a string is secretly an array. So that's why we need to tell it it's in memory.

You'll notice we can't add the storage keyword here, Solidity also knows that since this is a function, this name variable isn't actually getting stored anywhere.

So it says hey, you can't have that. You need to have it be memory or calldata and those are the only 2 that it accepts. So this is what we want our function to look like here.

So the summary of this is struct, mappings and arrays need to be given this memory or calldata keyword when adding them as a parameter to different functions.

We'll learn more about storage memory and calldata in later sessions.
