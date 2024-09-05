Hashing and Proof of Work
Proof of Work is another component of Bitcoin that is essential to its success.

Let's examine its origins and how it is accomplished before we dive into how it works for Bitcoin. 

The term "Proof of Work" is used to describe the solution to a computationally expensive challenge for computers. For instance, we could program a computer to search for a hash starting with three 5's. That might take some time guessing:

sha256("0"); // 5feceb…
sha256("1"); // 6b86b2…
sha256("2"); // d4735e…
// keep on guessing, keep on guessing…
sha256("5118"); // 555850…
Phew, took us a few guesses! 

The difficulty to come up with this input gets exponentially harder the more 5s we require the output hash to start with. This is how it's possible to control difficulty of Proof-Of-Work.

 Technically Bitcoin controls this on a finer level by specifying a target hash that the new block must be equal or lower to.

Why would you use Proof of Work?
One of the first use cases of Proof of Work was to prevent spamming. The idea is you can make each action a little bit difficult. If you want to send an email to your grandmother, maybe you need to come up with a hash that starts with three 5s. If a spammer wants to send an email to a million grandmas, they need to come up with a million hashes with three 5s. It becomes computationally expensive for them to do this kind of spamming.

 Proof-Of-Work saving one Grandma at a time!

Now you might be wondering: Could the spammer just use the same hash for all 1 million emails?

Yes, certainly! Well, that is, unless we build requirements to make each hash unique. For instance, we could require that the hash input include the "to" address and contents in order to send the email. If I wanted to send my Grandma a message "Hi Grandma!", I'd need to find a hash with my grandmas email address and the contents of the email plus some value to satisfy the hash:

sha256("Hi Grandma! coolgrandma555@hotmail.com 0"); // f2d9e2…
sha256("Hi Grandma! coolgrandma555@hotmail.com 1"); // 4ee36e…
sha256("Hi Grandma! coolgrandma555@hotmail.com 2"); // c25e5c…
// keep on guessing, keep on guessing…
sha256("Hi Grandma! coolgrandma555@hotmail.com 424"); // 5552ab…
 Found it! This didn't take my computer very long. We can manage the difficulty by changing the number of 5s to make it take a minute on my machine. This way it takes a spammer 1 million minutes (or 11.5 days!) to do it on a machine with similar capabilities. As a user, I barely notice the difference, yet it's much more troublesome for the spammer! 

 The number that we're appending on the end of the message here is generally referred to as a nonce. We'll see how both Ethereum and Bitcoin make use of nonces in a few ways!

How does Bitcoin use Proof of Work?
You can think of Proof of Work as the security of the Bitcoin system. Thousands of nodes are working to find hashes of data in the Bitcoin network at any given time. These machines are financially incentivized through rewards when they find the hash. This process is known as mining. 

In order to overpower this network and force your own version of the truth, you would need to come up with more computing power than all the nodes in the entire system. This is referred to as a 51% attack because you need to have 51% of the total hashing power in the network. Even accomplishing this you are extremely limited in what you can actually accomplish.

 Understanding this part has quite a bit to do with the underlying data structure of the blockchain itself! We'll go this in further detail later.

// Supplemental Resources on Proof of Work

> History
Adam Beck created the concept of HashCash as a way to combat email spamming. He presented this idea to the cypherpunk mailing list where several ideas were conceived afterwards:

Hal Finney invented Reusable Proofs of Work using the HashCash concept.

Wei Dai invented B-Money also using the HashCash concept.

Bitcoin Mining
Bitcoin uses Mining & Proof of Work to create a decentralized clearing house. Transactions are added to each mined block. Blocks are, on average, mined every 10 minutes. This, of course, varies due to the randomness of finding a valid hash.

The Target is adjusted so that, as more machines enter the network and the hash power increases, the difficulty of finding a new block increases (and vice-versa). This allows bitcoin to scale to its network size.

Mining Pools
There are many different types of Mining Pools in Bitcoin. As a user who wants to mine Bitcoin, you may join a mining pool so you get plenty of consistent, small rewards rather than one random large prize by finding the block (which, depending on your hash power, may not happen for a long time!).

 The current bitcoin coinbase reward is 6.25, which is roughly $60k USD at the time of writing.

For a good comparison of the mining pools see this document.