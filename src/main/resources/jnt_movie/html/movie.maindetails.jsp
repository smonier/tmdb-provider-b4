<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
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

<div id="mainCol">
    <div class="card card-inverse border-0">

        <!-- Image -->
        <img class="card-img-top" src="${currentNode.properties['backdrop_path'].string}"
             alt="${currentNode.properties['jcr:title'].string}">

        <!-- Text Overlay -->
        <div class="card-img-overlay">
            <h1 class="card-title text-white">${currentNode.properties['jcr:title'].string}
                (${currentNode.properties['release_date'].date.time.year + 1900})</h1>
            <h4 class="card-text text-white">${currentNode.properties['tagline'].string}</h4>
        </div>

        <div class="card-body lead">
            ${currentNode.properties['overview'].string}
        </div>

    </div>
    <br/>
    <h3>Cast</h3>
    <div id="owl-cast" class="owl-carousel owl-theme">
        <c:forEach items="${jcr:getChildrenOfType(currentNode,'jnt:cast')}" var="sub">
            <div class="item pr-2">
                <a href="<c:url value="${url.base}${sub.properties['person'].node.path}.html"/>">
                    <c:choose>
                    <c:when test="${sub.properties['profile'].string != null}">
                    <img width="50"
                         src="${sub.properties['profile'].string}"
                         alt="cover"
                         class="imgPoster"/></a><br/>
                </c:when>
                <c:when test="${sub.properties['profile'].string == null}">
                    <img width="50"
                         src="/modules/tmdb-provider/img/avatar.png"
                         alt="cover"
                         class="imgPoster"/></a><br/>
                </c:when>
                </c:choose>
                <div class="align-center">${sub.properties['character'].string}<br/>
                    <a href="<c:url value="${url.base}${sub.properties['person'].node.path}.html"/>">${sub.properties['name'].string}</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <h3>Crew</h3>
    <div id="owl-crew" class="owl-carousel owl-theme">
        <c:forEach items="${jcr:getChildrenOfType(currentNode,'jnt:crew')}" var="sub">
            <div class="item pr-2">
                <a href="<c:url value="${url.base}${sub.properties['person'].node.path}.html"/>">
                    <c:choose>
                    <c:when test="${sub.properties['profile'].string != null}">
                    <img width="50"
                         src="${sub.properties['profile'].string}"
                         alt="cover"
                         class="imgPoster"/></a><br/>
                </c:when>
                <c:when test="${sub.properties['profile'].string == null}">
                    <img width="50"
                         src="/modules/tmdb-provider/img/avatar.png"
                         alt="cover"
                         class="imgPoster"/></a><br/>
                </c:when>
                </c:choose>
                <div class="align-center">${sub.properties['job'].string}<br/>
                    <a href="<c:url value="${url.base}${sub.properties['person'].node.path}.html"/>">${sub.properties['name'].string}</a>
                </div>
            </div>
        </c:forEach>
    </div>


</div>

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