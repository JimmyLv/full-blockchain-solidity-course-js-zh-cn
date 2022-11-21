现在这个列表很棒，但如果我们知道某人的名字，但不知道他们最喜欢的号码，怎么办？那么，我们可以做的是，我们可以在整个数组中寻找那个人。
例如，在我们的合约中。我们可以开始寻找 John，好吧，让我们从零开始。 不，好吧，那是 Patrick，好吧，让我们从 1 开始。 找到了 John。 哦，太好了，他最喜欢的数字是 16。
这其实很容易，因为整个数组总共只有 2 个人。 但是如果总共有数百人在这个数组中呢？
那么，我们就得一直迭代到那个人所在的索引。这显然是非常低效的。
有什么其他的方法来存储这些信息，使其更容易和更快地访问呢？
我们可以使用的另一种数据结构是一种叫做 mapping 映射的东西，你可以把映射想象成一种字典。
它是一组键值对，每个 key 键返回与该键关联的某个 value 值，我们创建一个映射变量的方式与创建所有其他变量的方式完全相同。
所以这会是从 string 到 uint256 的 mapping() 类型，这将是我们的类型，可见性关键字将是 public。
我们把它叫做 nameToFavoriteNumber，现在我们有一个字典，每个名字都会映射到一个特定的数字。
所以让我们给 addPerson() 函数添加一些能力，所以我们要把我们的人添加到我们的数组中。
但我们也要把他们添加到我们的映射中，我们要做的是 nameToFavoriteNumber[_name] = \_favoriteNumber。
因此，让我们继续编译它。我们将转到我们的部署页面将部署它。点击。
我们有一个名为 favoriteNumber 的新按钮，如果我输入 Patrick。什么都没有显示出来。
通过输入 Patrick，你会看到我没有得到回应。通过输入 John ，我也得到了零个回应。如果我输入 Becca。我也得到一个零回应。
当你创建一个映射时，会把所有东西都初始化为空值。
现在这里每一个可能的字符串都有一个对应的初始值 favoriteNumber 为 0。
如果我们想改变这一点，就必须进去手动添加值，所以让我们继续在这里添加一个人到我们的映射中。
所以我们将添加 Patrick，并保存最喜欢的号码是 7，看起来这个交易确实完成了。
我们还将添加 Becca，说她最喜欢的号码是 13。 好吧，John 会说他最喜欢的号码是 16。
现在，如果我查找 Patrick，我会立即得到 Patrick 最喜欢的数字，我得到 7。
如果我们查找 John，我们马上得到的是 16。输入 Becca，我们会找到 13。
而且我们还可以在我们的 people 数组中看到他们，因为我们会将 people 持续 push 进去。
所以在索引为 0 时，我们看到 Patrick 在那里。在索引为 1 的地方，我们看到了 Becca，在 2 的地方我们看到了 John。
在我们的 mapping 中，string 类型的 name 被映射到 uint256 类型的 favoriteNumber。
我的很多变量，我喜欢让它们像这样显式命名，这是 nameToFavoriteNumber。

---

([02:50:17](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=10217s)): Basic Solidity - Mappings

Now this list is great, but what if we know someone's name, but we don't know their favorite number. Well, what we could do is we could look through the whole array looking for that person.
for example, in our contract. We can say OK I'm looking for
John, OK, let's start with zero. No, OK that's Patrick, OK, let's go to one. OK. That's John. Oh, great, his favorite number 16.
Well, this was really easy because we only had 2 people. But what if we had hundreds of people in this array?
Well, we'd keep have to iterating all the way up to the index at that person was in. It's obviously really inefficient.
What's another way to store this information so that it's much easier and quicker to access well.
Another data structure that we can use is something called a mapping, you can think of a mapping as sort of like a dictionary.
it's a set of keys, which each key returning a certain value associated with that key and we create a mapping variable the exact same way we create all of our other variables.
So this is going to be type mapping of string to uint256, this is going to be our type and visibility keyword is going to be public.
and we'll call it nameToFavoriteNumber and now we have a dictionary where every single name is going to map to a specific number.
So let's add some capability to our addPerson() function, so we are going to add our people to our array.
But let's also add them to our mapping here, what we'll do is we'll say nameToFavoriteNumber[_name] = \_favoriteNumber;
So let's go ahead and compile this. We'll go to our deploy screen will deploy this. Click.
We have a new button named a favorite number if I type in Patrick. Nothing shows up.
By typing Patrick, you'll see I get zero response. By typing John, I also get a zero response. If I type in Becca. I also get a zero response
When you create a mapping you initialize everything to its null value.
Every single possible string on the planet right now is initialized to having a favoriteNumber of 0.
If we want to change that will have to go in and manually add that so let's go ahead and add a person to our mapping here.
So we'll add Patrick and will save my favorite number is 7 and looks like that transaction did go through.
We will also add Becca and will say her favorite number is 13. Well, John will say his favorite number is 16.
Now, if I look up Patrick I'll immediately get back with Patrick's favorite number is I get 7 back.
If we look up John. We immediately get back 16. Becca we mainly get back to 13
and we also can see them in our array because we kept in this people does push.
so at zero, we see Patrick's there. At one we see Becca and at 2, we see John
in our mapping were saying the string name is being mapped to the uint256 favorite number
And a lot of my variables, I like to make them explicitly named like that, this is nameToFavoriteNumber.
