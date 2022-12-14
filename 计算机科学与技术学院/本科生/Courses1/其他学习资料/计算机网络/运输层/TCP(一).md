# 面向连接的TCP(一)

[TCP连接](#TCP连接)

[TCP报文段结构](#TCP报文段结构)

[序号和确认号](#序号和确认号)

[往返时间的估计与超时](#往返时间的估计与超时)

[设置和管理重传超时间隔](#设置和管理重传超时间隔)



## TCP连接

首先TCP连接提供的是全双工服务，所以TCP总是**点对点的**， 所以TCP只能容许两个主机之间的通信。对于TCP而言，两台主机是一对，而三台主机就多了！

一旦建立起一条TCP连接，两个应用进程之间就可以相互发送数据了。首先客户进程通过套接字(该进程之门)传递数据流。数据一旦通过该门，他就由客户中运行的TCP控制了。TCP将这些数据引导到该连接的**发送缓存**里。接下来TCP就会不时从发送缓存里面取出一块数据，并将数据传递到网络层。所以TCP可以从缓存中取出并放入报文段中的数据数量受限于 **最大报文段长度(即MSS，后面就用这个英文代替说明)**。MSS通常根据最初确定的由本地发送主机发送的最大链路层帧长度(**即最大传送单元MTU**), 如果链路层的MTU是1500字节，那么算上TCP/IP的首部的(通常40字节)，那一次可以发送的最大数据字节就是1460字节。

TCP为每块客户数据配上一个TCP首部，从而形成多个**TCP报文段**, 这些报文段被下传给网络层，网络层将其分别封装在网络层IP数据报中。然后这些IP数据报被发送到网络中。当TCP在另一端接收到一个报文段后，该报文段被放入该TCP连接的接受缓存中。应用程序从此缓存中读取数据流。该连接的每一段都有各自的发送缓存和接受缓存。

 ![image-20201212130617707](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135656.png)

**套接字Socket**：
应用层通过传输层进行数据通信时，TCP和UDP会遇到同时为多个应用程序进程提供并发服务的问题。多个TCP连接或多个应用程序进程可能需要 通过同一个TCP协议端口传输数据。**为了区别不同的应用程序进程和连接，许多计算机操作系统为应用程序与TCP／IP协议交互提供了称为套接字 (Socket)的接口，区分不同应用程序进程间的网络通信和连接。**

生成套接字，主要有3个参数：`通信的目的IP地址`、`使用的传输层协议(TCP或UDP)`和`使用的端口号`。Socket原意是“插座”。通过将这3个参数结合起来，与一个“插座”Socket绑定，应用层就可以和传输 层通过套接字接口，区分来自不同应用程序进程或网络连接的通信，实现数据传输的并发服务。      Socket可以看成在两个程序进行通讯连接中的一个端点，一个程序将一段信息写入Socket中，该Socket将这段信息发送给另外一个Socket中，使这段信息能传送到其他程序中。


## TCP报文段结构

那就让我们来看看TCP数据报的结构

![image-20201212130804913](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135652.png)

首先可以看到，TCP报文段由首部字段和一个数据字段组成。数据字段前面说过包含一块应用数据。MSS限制了TCP从应用数据中取出来的数据。当传送一个web数据时，通常被分为多个以MSS为大小的TCP报文段。通常TCP报文的首部大小为20字节。

首部包括**源端口号**和**目的端口**, 他被用于多路复用/分解来自或送到上层应用数据。同UDP一样TCP首部也包括**检验和字段**, TCP报文段首部还包含以下字段：

 1.源端口：16bits，范围0 ~ 65525.
 
 2.目的端口：16bits，范围同上
 
 3.数据序号：32bits，TCP 连接中传送的数据流中的每一个字节都编上一个序号。序号字段的值则指的是本报文段所发送的数据的第一个字节的序号。
 
 4.确认序号：32bits，期望收到对方的下一个报文段的数据的第一个字节的序号。
 
 5.数据偏移：4bits，它指出报文数据距TCP报头的起始处有多远(TCP报文头长度)。一个bit代表4字节，一个报文头最长就是60字节
 
 6.保留字段：6bits，保留给未来使用
 
 7.
   * URG：紧急比特，1bit，当`URG = 1`时，表明紧急指针字段有效。它告诉系统此报文段中有紧急数据，应尽快传送(相当于高优先级的数据)
   
   * ACK：确认比特，1bit，只有当`ACK = 1`时确认号字段才有效。当ACK = 0时，确认号无效
   
   * PSH：推送比特，1bit，接收方 TCP 收到推送比特置1的报文段，就尽快地交付给接收应用进程，而不再等到整个缓存都填满了后再向上交付
   
   * RST：复位比特，1bit，当RST=1时，表明TCP连接中出现严重差错(如由于主机崩溃或其他原因)，必须释放连接，然后再重新建立运输连接
   
   * SYN：同步比特，1bit，同步比特 SYN 置为 1，就表示这是一个连接请求或连接接受报文
   
   * FIN：终止比特，1bit，用来释放一个连接。当FIN=1 时，表明此报文段的发送端的数据已发送完毕，并要求释放运输连接
 
 8.窗口大小：16bits，窗口字段用来控制对方发送的数据量，单位为字节。TCP 连接的一端根据设置的缓存空间大小确定自己的接收窗口大小，然后通知对方以确定对方的发送窗口的上限。
 
 9.检验和：16bits，检验范围包括首部和数据两部分。和UDP用户数据报一样，在计算校验和时，要在TCP报文段加上12字节的伪首部。

 10.紧急指针字段：16bits，紧急指针指出在本报文段中的紧急数据的最后一个字节的序号。
 
 11.选项字段：长度可变，由于数据偏移的限制，最大为40字节
   * MSS：上文中讲到要是IP和TCP的此段没有，都占用的是20字节，那么1500字节就占用了1460字节。但这个值还是要协商决定
    
   * 窗口扩大：窗口扩大选项是为了扩大窗口。TCP首部中窗口字段长度是16位，因此最大窗口大小就是64k字节。对于包含卫星信道的网络可能是不够用的。可以在双方初始建立TCP连接的时候就进行协商。
    
   * 时间戳：用来计算往返时间RTT。发送方在发送报文段时把当前时钟的时间值放入时间戳字段，接收方在确认该报文段时把时间戳字段值复制到时间戳回送回答字段。因此，发送方在收到确认报文后，可以准确地计算RTT来。


## 序号和确认号

TCP报文段首部中两个最重要的字段是序号字段和确认号字段。这两个字段是TCP可靠传输服务的关键部分。那让我们来看看这里面到底放了什么东西。

TCP把数据看成一个无结构的、有序的字节流。我们从TCP对序号的使用上可以看出 这一点，因为序号是建立在传送的字节流之上，而不是建立在传送的报文段的序列之上。 **一个报文段的序号是该报文段首字节的字节流编号(这点很重要啊)**,  被送入TCP中的字节会被TCP隐式地对数据流中的每一个字节编号。如图：

![image-20201212132625318](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135649.png)

序列号说明白了，我们来看看确认号。前面说过TCP是全双工的，因此主机A在向主机B发送数据的同时，也许也接收来自主机B的数据。主机B到达的每个报文段中都有一个许好用于从B流向A的数据。主机A填充进报文段的确认号就是主机A期望从主机B收到的下一字节的序号。因为TCP只缺人从流中至第一个丢失字节为止的字节，所以TCP被称为提供**累积确认**。同时如果乱序到达的话，接收方保留失序字节，并等待缺少的字节以填补该间隔。

由于文本原因不变展示全部，如果想要深入理解可以参考《计算机网络自顶向下的方法》 第155~156页的内容

### 往返时间的估计与超时

我们开始学习TCP定时器的时间管理，要考虑以下TCP是如何估计发送方与接收方之间的往返时间的。通过如下方法:报文段的样本RTT(表示为SampleRTT)就是从某报文段被发出(即交给IP层)到对该报文段的确认被收到之间的时间量。大多数TCP的实现仅在某个时刻做一次SampleRTT测量，而不是为每个发送的报文段测量一个SampleRTT。这就是说，在任意时刻，仅为一个已发送的但目前尚未被确认的报文段估计SampleRTT, 从而产生一个接近每个RTT的新SampleRTT值。另外，TCP决不为已被重传的报文段计算SampleRTT；它仅为传输一次的报文段测量SampleRTT。

显然，由于路由器的拥塞和端系统负载的变化，这些报文段的SampleRTT值会随之波动。所以TCP会维护一个SampleRTT均值(称为EstimatedRTT)。一旦获得一个新SampleRTT时，TCP就会根据以下公式来更新EstimatedRTT:

![image-20201212135708249](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135828.png)

其中α的推荐值是0.125



除了估算RTT外，测量RTT的变化也是有价值的

![image-20201212135716022](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135824.png)

注意到DevRTT是一个SampleRTT与EstimatedRTT之间差值的EWMA。如果SampleRTT值波动较小，那么DevRTT的值就会很小；另一方面，如果波动很大，那么DevRTT 的值就会很大。β的推荐值为0. 25。



## 设置和管理重传超时间隔

假设已经给岀了 EstimatedRTT值和DevRTT值，那么TCP超时间隔应该用什么值呢? 很明显，超时间隔应该大于等于EstimatedRTT,否则，将造成不必要的重传。但是超时间隔也不应该比EstimatedRTT大太多，否则当报文段丢失时，TCP不能很快地重传该报文段，导致数据传输时延大。因此要求将超时间隔设为EstimatedRTT加上一定余量。当SampleRTT值波动较大时，这个余量应该大些；当波动较小时，这个余量应该小些。因此，DevRTT值应该在这里发挥作用了。在TCP的确定重传超时间隔的方法中，所有这些 因素都考虑到了: 

![image-20201212135725623](https://zouyishan.oss-cn-beijing.aliyuncs.com/images/20201212135820.png)

推荐的初始TimeoutInterval值为1秒。同时，出现超时后，TimeoutInterval值将会加倍，以免即将被确认的后继报文段过早出现超时。然而，只要收到报文段并更新EstimatedRTT，就使用上述公式再次计算TimeoutInterval。
