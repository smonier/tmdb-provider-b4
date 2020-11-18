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

<template:addResources type="css" resources="movieCard.css"/>


<c:set var="linkUrl" value="${url.base}${currentNode.path}.html"/>




    <!-- flip-card-container -->
    <div class="flip-card-container" style="--hue: 220">
        <div class="flip-card">

            <div class="card-front">
                <figure>
                    <div class="img-bg"></div>
                    <img src="${currentNode.properties['poster_path'].string}" alt="${currentNode.properties['original_title'].string}">
                    <figcaption>${currentNode.properties['original_title'].string}<br/>${currentNode.properties['release_date'].date.time.year + 1900}</figcaption>

                </figure>

                <ul>
                    <li>${currentNode.properties['tagline'].string}</li>
                    <jcr:nodeProperty node="${currentNode}" var="genres" name="j:tagList"/>
                    <c:if test="${!empty genres}">
                        <li>
                            <c:forEach items="${genres}" var="genre">
                                ${genre.string}
                            </c:forEach>
                        </li>
                    </c:if>
                </ul>
            </div>

            <div class="card-back">
                <figure>
                    <div class="img-bg"></div>
                    <img src="${currentNode.properties['backdrop_path'].string}" alt="${currentNode.properties['original_title'].string}">
                </figure>

                <button><a href="${linkUrl}" class="button">READ MORE</a></button>

                <div class="design-container">
                    <span class="design design--1"></span>
                    <span class="design design--2"></span>
                    <span class="design design--3"></span>
                    <span class="design design--4"></span>
                    <span class="design design--5"></span>
                    <span class="design design--6"></span>
                    <span class="design design--7"></span>
                    <span class="design design--8"></span>
                </div>
            </div>

        </div>
    </div>
    <!-- /flip-card-container -->