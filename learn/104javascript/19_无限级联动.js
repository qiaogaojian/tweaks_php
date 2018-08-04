/*
文  件: 史上最简洁,最强大,兼容性最好的无限级联动菜单
author: 燕十八
日  期: 2012-4-26 22:05
Email : yanshiba@gmail.com

测试浏览器: IE6/7/8/9,ff12,chrome18,opera12,safari
测试结果:均已通过

版权声明:您可以自由使用本程序,但必须保留本段注释
*/

function menus ()
{
    var nokia = (function ()
    {
        var tel = false;
        if (window.XMLHttpRequest)
        {
            tel = new XMLHttpRequest();
        } else
        {
            tel = new window.ActiveXObject("Microsoft.XMLHTTP");
        }
        return tel;
    })();

    var loader = document.createElement("img");
    loader.setAttribute("src", "loader.gif");
    var lian = document.getElementById("lian");
    var xmldom = null;

    nokia.open("GET", "area.xml", false);
    nokia.onreadystatechange = function ()
    {
        if (nokia.readyState == 4 && (nokia.status == 200 || nokia.status == 304))
        {
            xmldom = nokia.responseXML;
            lian.removeChild(loader); // 删除图标
        }
    };

    lian.appendChild(loader); // 加载图标
    nokia.send(null);

    newOpt = function (v, t)
    {
        var opt = document.createElement("option");
        var cont = document.createTextNode(t || v);
        opt.appendChild(cont);
        opt.setAttribute("value", v);

        return opt;
    };

    newSel = function newSel (name)
    {
        var sel = document.createElement("select");
        sel.setAttribute("name", name);

        return sel;
    };

    var _init;
    this.init = _init = function (lev, ming)
    {
        // 清空后面的select
        var sons = lian.getElementsByTagName("select");
        if (sons.length > lev)
        {
            for (var i = (l = sons.length); i > lev; i--)
            {
                lian.removeChild(sons[i - 1]);
            }
        }

        if (ming == "")
        {
            return;
        }

        var arr = xmldom.getElementsByTagName(ming)[0].childNodes;

        if (arr.length == 0)
        {
            return;
        }

        var opt = newOpt("", "请选择" + ming + "的下级地址");
        var zone = newSel("zone_" + lev);
        zone.appendChild(opt);

        for (var i = 0, l = arr.length; i < l; i++)
        {
            zone.appendChild(newOpt(arr[i].nodeName));
        }

        zone.onchange = function ()
        {
            _init(
                lev + 1,
                this.options[this.selectedIndex].attributes.getNamedItem("value")
                    .nodeValue
            );
        };
        lian.appendChild(zone);
    };
}

window.onload = function ()
{
    new menus().init(0, "中国");
};
