    function addLoadEvent(func) {                               //参数func为页面加载完成要执行的函数
        var oldonload = window.onload;                         //把现有的window.onload事件处理函数的值存入变量oldonload中
        if (typeof window.onload != 'function') {                //判断  如果onload处理函数没绑定任何函数，则添加新函数；否则，追加新函数
            window.onload = func;
        } else {
            window.onload = function () {                        //这里使用了匿名函数包纳两个函数
                oldonload();
                func();
            }
        }
    }

    /*******************跟JavaScript中的insertBefore方法对应的一个函数*******************/
    function insertAfter(newElement, targetElement) {
        var parent = targetElement.parentNode;
        if (parent.lastChild == targetElement) {
            parent.appendChild(newElement);
        } else {
            parent.insertBefore(newElement, targetElement.nextElementSibling);
        }
    }

    /******************动态添加class属性的函数*****************************/
    function addClass(element, value) {                                    //调用该函数，就是创建一个例如：class="here"，给标签增加了增加了这么一个属性
        if (!element.className) {
            element.className = value;
        } else {
            newClassName = element.className;
            newClassName += " ";
            newClassName += value;
            element.className = newClassName;
        }
    }
    /*****************高亮显示导航栏当前点击菜单***************************/
    function highlightPage() {
        //判断
        if (!document.getElementById) return false;
        if (!document.getElementsByName) return false;
        if (!document.getElementById("bs-example-navbar-collapse-1")) return false;

        //获取
        var nav = document.getElementById("bs-example-navbar-collapse-1");
        var links = document.getElementsByTagName("a");

        //逻辑操作
        for (var i = 0; i < links.length; i++) {
            var linkurl = links[i].getAttribute("href");            //获取具有href的属性值
            var currenturl = document.location.href;                //获取当前的href属性值
            if (currenturl.indexOf(linkurl) != -1) {
                links[i].parentElement.className = "active";
                var linktext = links[i].parentElement.lastChild.nodeValue.toLowerCase();  //把提取出来的文本转换为小写
                document.body.setAttribute("id", linktext);
            }
        }
    }
    addLoadEvent(highlightPage);                                   //最后调用该函数