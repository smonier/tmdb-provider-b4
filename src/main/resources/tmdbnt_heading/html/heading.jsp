<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css" />--%>
<%--<template:addResources type="javascript" resources="jquery.min.js,popper.min.js,bootstrap.min.js"/>--%>
<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty bindedComponent && jcr:isNodeType(bindedComponent, 'jnt:movie, tmdbnt:heading')}">
    <c:set var="targetProps" value="${bindedComponent.properties}"/>
</c:if>
<c:set var="title" value="${targetProps['jcr:title'].string}"/>
<c:set var="tagline" value="${targetProps['tagline']}"/>
<c:set var="genres" value="${targetProps['j:tagList']}"/>
<c:set var="image" value="${targetProps['backdrop_path']}"/>
<c:set var="release_date" value="${targetProps['release_date'].date.time.year + 1900}"/>




<div class="inner-page">
    <div class="slider-item" style="background-image: url('${image.string}');">
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-12 text-center col-sm-12 pt-5 element-animate">
                    <%-- --%>
                    <h1 class="pt-4"><span>${title}</span></h1>
                       (${release_date})
                        <p class="pt-2 pb-3">${tagline}</p>
                         <c:if test="${!empty genres}">
                            <c:forEach items="${genres}" var="genre">
                                <i class="fa fa-tag" aria-hidden="true"></i>  <span class="categorytitle mr-3">${genre.string} </span>
                            </c:forEach>
                        </c:if>
                </div>
            </div>
        </div>
    </div>
</div>