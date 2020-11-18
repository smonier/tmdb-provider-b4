<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>


<template:addResources type="css" resources="owl.theme.default.css"/>
<template:addResources type="css" resources="owl.carousel.css"/>
<template:addResources type="css" resources="owl.transitions.css"/>
<template:addResources type="javascript" resources="jquery.mousewheel.js"/>


<h2 id="title"><span itemprop="name">${currentNode.properties['name'].string}</span></h2>

${currentNode.properties['biography'].string}


<hr>
<h2>Known for</h2>
<jcr:jqom var="res" statement="SELECT * FROM [jnt:cast] where id='${currentNode.name}'"/>
<div id="owl-demo" class="owl-carousel owl-theme">
    <c:forEach items="${res.nodes}" var="cast">
        <div class="item pr-2">
            <a href="<c:url value="${url.base}${cast.parent.path}.html"/>">
                <c:choose>
                <c:when test="${not fn:containsIgnoreCase(cast.parent.properties['poster_path'].string, 'null')}">
                <img width="50"
                     src="${cast.parent.properties['poster_path'].string}"
                     alt="cover"
                     class="imgPoster"/></a><br/>
            </c:when>
            <c:when test="${ fn:containsIgnoreCase(cast.parent.properties['poster_path'].string, 'null')}">
                <img width="50"
                     src="/modules/tmdb-provider/img/pellicule.png"
                     alt="cover"
                     class="imgPoster"/></a><br/>
            </c:when>
            </c:choose>
            </a><br/>
            <div class="align-center">${cast.properties['character'].string}<br/>
                <a href="<c:url value="${url.base}${cast.parent.path}.html"/>">${cast.parent.properties['jcr:title'].string}</a>
            </div>
        </div>
    </c:forEach>

</div>
<ul>

</ul>
<hr>

<jcr:jqom var="res" statement="SELECT * FROM [jnt:crew] where id='${currentNode.name}'"/>
<ul>
    <c:forEach items="${res.nodes}" var="crew">
        <li>
                ${crew.properties['job'].string}
            - <a
                href="<c:url value="${url.base}${crew.parent.path}.html"/>">${crew.parent.properties['jcr:title'].string}</a>
        </li>
    </c:forEach>
</ul>

<script>
    var owl = $('.owl-carousel');

    owl.owlCarousel({
        loop: false,
        nav: false,
        margin: 5,
        dots: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            960: {
                items: 5
            },
            1200: {
                items: 6
            }
        }
    });
    owl.on('mousewheel', '.owl-stage', function (e) {
        if (e.deltaY > 0) {
            owl.trigger('next.owl');
        } else {
            owl.trigger('prev.owl');
        }
        e.preventDefault();
    });
</script>