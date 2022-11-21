现在这个列表很棒，但是如果我们知道某人的名字，但是我们不知道他们最喜欢的号码呢？ 嗯，我们能做的就是翻遍整个阵列寻找那个人。
例如，在我们的合同中。 我们可以说 OK 我在寻找
约翰，好吧，让我们从零开始。 不，好吧，那是帕特里克，好吧，我们去一个。 好的。 那是约翰。 哦，太好了，他最喜欢的数字 16。
嗯，这真的很容易，因为我们只有两个人。 但是如果我们有数百人在这个阵列中呢？
嗯，我们必须一直迭代到那个人所在的索引。 这显然非常低效。
存储这些信息的另一种方法是什么，这样可以更容易、更快地访问。
我们可以使用的另一种数据结构是称为映射的东西，您可以将映射视为有点像字典。
它是一组键，每个键返回与该键关联的某个值，我们创建一个映射变量的方式与创建所有其他变量的方式完全相同。
所以这将是字符串到 uint256 的类型映射，这将是我们的类型和可见性关键字将是公共的。
我们称之为 nameToFavoriteNumber，现在我们有了一个字典，每个名字都将映射到一个特定的数字。
所以让我们为 addPerson() 函数添加一些功能，因此我们将把我们的人添加到我们的数组中。
但是让我们也把它们添加到我们的映射中，我们要做的是说 nameToFavoriteNumber[_name] = \_favoriteNumber；
所以让我们继续编译它。 我们将转到我们的部署屏幕将部署它。 点击。
如果我输入帕特里克，我们有一个名为最喜欢的数字的新按钮。 什么都没出现。
输入帕特里克，你会看到我没有回应。 通过输入约翰，我也得到零响应。 如果我输入贝卡。 我也得到零回应
当您创建映射时，您将所有内容初始化为其空值。
现在这个星球上的每一个可能的字符串都被初始化为最喜欢的数字为 0。
如果我们想改变，那就必须进去手动添加，所以让我们继续在这里添加一个人到我们的映射中。
所以我们会添加 Patrick 并保存我最喜欢的数字是 7，看起来交易确实完成了。
我们还会加上贝卡，说她最喜欢的数字是 13。 约翰和威尔说他最喜欢的数字是 16。
现在，如果我查帕特里克，我会立即得到帕特里克最喜欢的数字，我得到 7。
如果我们去找约翰。 我们立即得到 16。 Becca 我们主要回到 13 岁
我们也可以在我们的数组中看到它们，因为我们一直在这个人确实在推动。
所以在零点，我们看到帕特里克在那里。 一点钟我们看到贝卡二点钟我们看到约翰
在我们的映射中，我们说字符串名称被映射到 uint256 最喜欢的数字
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
We will also add Becca and will say her favorite number is 13. Well, John and will say his favorite number is 16.
Now, if I look up Patrick I'll immediately get back with Patrick's favorite number is I get 7 back.
If we look up John. We immediately get back 16. Becca we mainly get back to 13
and we also can see them in our array because we kept in this people does push.
so at zero, we see Patrick's there. At one we see Becca and at 2, we see John
in our mapping were saying the string name is being mapped to the uint256 favorite number
And a lot of my variables, I like to make them explicitly named like that, this is nameToFavoriteNumber.
