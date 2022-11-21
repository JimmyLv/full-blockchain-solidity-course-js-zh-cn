- [x]  [P18 2-6：Solidity 基础 - 错误和警告 01:00](https://www.bilibili.com/video/BV1Ca411n7ta?p=18)

飞书妙记：[（32 小时最全课程）区块链，智能合约 & 全栈 Web3 开发 - 018 - 2-6：Solidity 基础 - 错误和警告](https://jimmylv.feishu.cn/minutes/obcnpx1qpzoest3u763825u3)

好，你可能已经看到了这个，但如果我继续编译的话，你会看到一个红点。然后在滚动条的位置查看它，显示的相关错误：预期是 ‘;’ 分号，但遇到了 ‘}’ 括号。
所有这些错误消息，意味着你的代码没有编译成功，它没有按预期工作，所以现在我可以在这里添加一个 ‘;’ 分号。
重新编译，绿色代表编译成功，现在如果我删除顶部这一行作为示例。编译，实际上会看到一个黄色的指示。
黄色代表警告。我得到的警告信息是：Warning : SPDX license identifier not provided （警告：未提供SPDX许可证标识符）
你应该添加它，所以让我们继续将它添加回来，重新编译，警告就会消失。
警告不会阻止你的代码进行编译，因此如果你收到警告，这没关系。
但听取警告通常是个好主意，因为它们通常会提供关于如何改进你的智能合约的非常有见地的信息。
因此，总结一下，如果它是红色的，它就出错了。如果它是黄色的，你可能需要检查一下，但它不会阻止你继续编码。

---

([02:45:34](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=9934s)): Basic Solidity - Errors & Warnings

Now, you've probably seen this by now. But if I go ahead and compile, and I see a little, little red one here, I roll over. And it says something about error, expected semicolon, but got bracket, all these errors mean that your code isn't compiling. It's not working as expected. So now I can go over here and do a little semicolon recompile, and I get a green. Now if I delete this top line, for example, and I compile it, actually get a yellow thing. Yellow stands for warnings, the warning that I get is warning SPX license identifier, not provided, you should add it. So let's go ahead and add that back. recompile. And the warning goes away. Warnings Don't stop your code from compiling. So if you get warnings, it's okay. But it's usually a good idea to listen to the warnings, because often they'll give really insightful information about how to improve your smart contracts. So to summarize, if it's red, it's broken. If it's yellow, you might want to check it out. But it won't stop you from continuing to code.
