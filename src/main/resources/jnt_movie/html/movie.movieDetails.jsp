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

<template:addResources type="css" resources="tmdbmovie.css"/>
<template:addResources type="css" resources="circle.css"/>


<div class="movie-card">

    <div class="containerMovie">

        <a href="<c:url value='${url.base}${currentNode.path}.html'/>"><img
                src="${currentNode.properties['poster_path'].string}" alt="cover" class="cover"/></a>

        <div class="hero responsive"
             style='background: url("${currentNode.properties['backdrop_path'].string}");opacity:200%'>

            <div class="details">

                <div class="title1">${currentNode.properties['original_title'].string}</div>

                <div class="title2">${currentNode.properties['tagline'].string}</div>

                <fieldset class="rating">
                    <div class="rating">
                        <div id="updateRating" itemprop="aggregateRating" itemscope=""
                             itemtype="http://schema.org/AggregateRating">
                            <p class="average"><span id="rating_hint"
                                                     itemprop="ratingValue">${currentNode.properties['vote_average'].string}</span>/<span
                                    itemprop="bestRating">10</span> (<span
                                    itemprop="ratingCount">${currentNode.properties['vote_count'].string}</span> votes)
                            </p>
                        </div>
                    </div>
                </fieldset>
                <div class="popularity">
                    <fmt:formatNumber var="popularity" type="number" minFractionDigits="0" maxFractionDigits="0"
                                      value="${currentNode.properties['vote_average'].string*10 } "/>

                    <div class="c100 p${popularity} small">
                        <span>${popularity}%</span>
                        <div class="slice">
                            <div class="bar"></div>
                            <div class="fill"></div>
                        </div>
                    </div>
                </div>
            </div> <!-- end details -->

        </div> <!-- end hero -->

        <div class="description">

            <div class="column1">

                <jcr:nodeProperty node="${currentNode}" var="genres" name="j:tagList"/>
                <c:if test="${!empty genres}">
                    <c:forEach items="${genres}" var="genre">
                        <span class="tag">${genre.string}</span><br/>
                    </c:forEach>
                </c:if>

                <div class="pt-2">
                    <a href="https://www.imdb.com/title/${currentNode.properties['imdb_id'].string}"><img
                            src="https://m.media-amazon.com/images/G/01/IMDb/BG_rectangle._CB1509060989_SY230_SX307_AL_.png"
                            width="80px"/></a>
                </div>
            </div> <!-- end column1 -->

            <div class="column2">
                <p>Release date: ${currentNode.properties['release_date'].date.time.year + 1900} -
                    Runtime: ${currentNode.properties['runtime'].string} min</p>
                <p>${currentNode.properties['overview'].string}</p>

                <div class="avatars">
                    <c:forEach items="${jcr:getChildrenOfType(currentNode,'jnt:cast')}" var="sub" varStatus="status">
                        <c:if test="${status.count <= 8 && sub.properties['profile'].string != null}">
                            <a href="<c:url value="${url.base}${sub.properties['person'].node.path}.html"/>"
                               data-tooltip="${sub.properties['name'].string}" data-placement="top">
                                <img src="${sub.properties['profile'].string}"
                                     alt="${sub.properties['character'].string}"/>
                            </a>
                        </c:if>
                    </c:forEach>

                </div> <!-- end avatars -->


            </div> <!-- end column2 -->
        </div> <!-- end description -->


    </div> <!-- end container -->
</div>
<!-- end movie-card -->