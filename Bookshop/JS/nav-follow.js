    function addLoadEvent(func) {                               //����funcΪҳ��������Ҫִ�еĺ���
        var oldonload = window.onload;                         //�����е�window.onload�¼���������ֵ�������oldonload��
        if (typeof window.onload != 'function') {                //�ж�  ���onload������û���κκ�����������º���������׷���º���
            window.onload = func;
        } else {
            window.onload = function () {                        //����ʹ������������������������
                oldonload();
                func();
            }
        }
    }

    /*******************��JavaScript�е�insertBefore������Ӧ��һ������*******************/
    function insertAfter(newElement, targetElement) {
        var parent = targetElement.parentNode;
        if (parent.lastChild == targetElement) {
            parent.appendChild(newElement);
        } else {
            parent.insertBefore(newElement, targetElement.nextElementSibling);
        }
    }

    /******************��̬���class���Եĺ���*****************************/
    function addClass(element, value) {                                    //���øú��������Ǵ���һ�����磺class="here"������ǩ��������������ôһ������
        if (!element.className) {
            element.className = value;
        } else {
            newClassName = element.className;
            newClassName += " ";
            newClassName += value;
            element.className = newClassName;
        }
    }
    /*****************������ʾ��������ǰ����˵�***************************/
    function highlightPage() {
        //�ж�
        if (!document.getElementById) return false;
        if (!document.getElementsByName) return false;
        if (!document.getElementById("bs-example-navbar-collapse-1")) return false;

        //��ȡ
        var nav = document.getElementById("bs-example-navbar-collapse-1");
        var links = document.getElementsByTagName("a");

        //�߼�����
        for (var i = 0; i < links.length; i++) {
            var linkurl = links[i].getAttribute("href");            //��ȡ����href������ֵ
            var currenturl = document.location.href;                //��ȡ��ǰ��href����ֵ
            if (currenturl.indexOf(linkurl) != -1) {
                links[i].parentElement.className = "active";
                var linktext = links[i].parentElement.lastChild.nodeValue.toLowerCase();  //����ȡ�������ı�ת��ΪСд
                document.body.setAttribute("id", linktext);
            }
        }
    }
    addLoadEvent(highlightPage);                                   //�����øú���