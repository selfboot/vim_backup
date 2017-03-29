本仓库为 Vim 配置文件，这里使用[vundle](https://github.com/VundleVim/Vundle.vim)来管理插件。

# 初始化vim配置

要想在新的机器使用我这里的配置，只需要下面命令即可：
  
```
$ git clone http://github.com/xuelangZF/vim_backup.git ~/.vim
$ cd ~/.vim 
$ ln -s `pwd`/.vimrc ~/.vimrc
$ git submodule init	
$ git submodule update
```

要更新 vundle，只需要进入 `~/.vim/bundle/Vundle.vim/`目录，然后运行

```
$ git checkout master; git pull
```

# 插件管理命令

打开vim, 运行下列命令：

* 安装插件: BundleInstall 
* 更新插件: BundleUpdate
* 清除不再使用的插件:    BundleClean
* 列出所有插件: BundleList
* 查找插件: BundleSearch

# 其他问题

## root vim

如果以非root运行vim，那么会从 `/home/<user>` 读取配置文件。如果以 `sudo vim filename` 来运行vim的话，会从 `/root`读取配置。为了使 root 用户也使用某个用户的 vim 配置，可以使用下面的方式创建软链接。

```
sudo ln -s /home/<user>/.vimrc /root/.vimrc
sudo ln -s /home/<user>/.vim/ /root/.vim/
```

注意替换 `<user>` 为自己的用户。当然也可以不用 sudo 来执行 vim，在最后保存的时候，用下面 vim 命令（配置文件中添加Sw为 `:w !sudo tee % > /dev/null` 的alias）。

```
:Sw
```

# 参考  

[vim中的杀手级插件: vundle][1]  
[分布式 Git - 为项目作贡献][2]	 
[Git 工具 - 子模块][3]  
[Git Submodule Tutorial][4]  
[How do I remove a Git submodule?][5]

[1]:http://zuyunfei.com/2013/04/12/killer-plugin-of-vim-vundle/  
[2]:http://git-scm.com/book/zh/%E5%88%86%E5%B8%83%E5%BC%8F-Git-%E4%B8%BA%E9%A1%B9%E7%9B%AE%E4%BD%9C%E8%B4%A1%E7%8C%AE  
[3]:http://git-scm.com/book/zh/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97  
[4]:https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial#Removal
[5]:http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule


