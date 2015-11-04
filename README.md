# QTunetBash
Bash版本的Tunet客户端，提供保持在线功能，
与老版本的Shell兼容。

## 使用

普通使用直接不加参数运行即可。

```bash
bash QTunetBash.sh
```

logout请用如下命令。

```bash
bash QTunetBash.sh -o
```

如果希望记住用户名/密码，请直接打开QTunetBash.sh，按照说明填入用户名和密码。

如果你用的系统中没有md5或md5sum，请自己计算一下密码的MD5，并记录到QTunetBash.sh中。


## 风险

本软件的使用风险与QTunet相同，请参考[QTunet的说明](https://github.com/lpffeihu/QTunet)。

## 如果你是校内固定IP

如果你是校内固定IP且是这个IP的所有者（即这个账号是用你的Tunet号申请的），你可以直接登录进Usereg，点“静态IP管理”，
里边就能看到这个IP。在这种情况下你可以修改该IP的类型为“免认证”，[像这样](https://cloud.githubusercontent.com/assets/1330058/10931869/76b2fcd2-8306-11e5-9101-e0ff3efcd6fe.png)。

此时貌似就不占Tunet三个连接数的限制了（可能当月不行，下月可以），[像这样](https://cloud.githubusercontent.com/assets/1330058/10931874/7aad0058-8306-11e5-80a7-ebaea1369168.png)。

## 关于作者

Author: feihu @ [Gu-Lab](http://gu.ee.tsinghua.edu.cn/)

Author Email: lpfffeihu (a.t.) gmail.com

作者将于2016年1月毕业，如果你愿意继续维护这个项目，请邮件联系。
