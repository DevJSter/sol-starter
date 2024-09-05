Congrats on finishing Week 1 🎉
Celebration

Learning Retrospective
This week, we went through the foundations of blockchain technology: cryptography. We broke down the building blocks of blockchains, and even created our own simple chain containing blocks and data.

Let's quickly summarize some of the important topics we learned this week (hint, these are important for the next weeks!):

hash functions: any function that takes some data and produces a digest of a fixed size.

![image](https://github.com/user-attachments/assets/67692b6c-06fc-4438-9429-e75f9061246b)


That's easy enough. What is very important is remembering the properties of a strong hash function:

deterministic 🔮: for x input into the SHA-256 function, you will always get y.
pseudorandom 🎲: one input-output combination does not reveal anything about any other input-output combo into the hash function.
one-way ➡️: Given the output y of SHA-256, it is extremely difficult to guess as to what the original input x was.
fast to compute 🏎: calculation of outputs is extremely fast.
collision-resistant 💥: You CANNOT get the same y for two different x inputs.
public-key cryptography: cryptography based on two keys: one public key, one private key. This allows the use of digital signatures, triggering a variety of use cases. For one, a user can cryptographically sign a message and send it to others. Anyone will be able to verify the integrity and sender of the message, all without revealing the sender's private key. a private key. ECDSA, heavily used in this weekend's project, is an algorithm that is based on public-key cryptography.

consensus mechanisms: also referred to as consensus rules, this is how decentralized networks agree on what data is considered valid or not. Proof-of-work is the consensus mechanism used by Bitcoin. Until September 2022, Ethereum now uses proof-of-stake consensus.

Next Steps
Provide Feedback 🧠
As an early access member, we'd love your help in building AU to be a maximum experience for students going through the content after you. If you have the time, please provide feedback on Week 1:

Please visit this link to provide feedback, the form takes less than 1 minute to fill out completely! ⭐️⭐️⭐️⭐️⭐️

Share What You Learned on Twitter!
We highly encourage you to share out what you've learned with the wider community 🌎

Share a recap on Twitter!

Help Other Students!
There's no better way to solidify your understanding than to teach it to others, jump into Discord and help other students who may be stuck to solidify your mastery of these concepts. Students who help others will also be considered for our official Teaching Assistant program 👀

Help other students

Next we'll be jumping into blockchain storage and learn about data storage on chain and culminate in building our own blockchain⛓
