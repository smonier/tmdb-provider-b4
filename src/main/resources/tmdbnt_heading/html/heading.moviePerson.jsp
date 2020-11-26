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

<style>
    .headermessage {
        margin: 19px;
        color: black;
        font-family: 'Open Sans', sans-serif;
        font-size: 16px;
        font-weight: bold;
    }

    .image-block {
        border: 15px solid black;
        background-color: black;
        padding: 0px;
        margin: 0px;
        height: 550px;
        width: 200px;
        text-align: center;
        vertical-align: bottom;
    }

    .image-block > p {
        width: 100%;
        height: 100%;
        font-weight: normal;
        font-size: 19px;
        padding-top: 150px;
        background-color: rgba(3, 3, 3, 0.0);
        color: rgba(6, 6, 6, 0.0);
    }

    .image-block:hover > p {
        background-color: rgba(3, 3, 3, 0.5);
        color: white;
    }
    .image-block > p a {
        display: none;
    }
    .image-block:hover > p a {
        display: inline-block;
    }
</style>


<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty bindedComponent && jcr:isNodeType(bindedComponent, 'jnt:moviePerson, tmdbnt:heading')}">
    <c:set var="targetProps" value="${bindedComponent.properties}"/>
    <c:set var="targetNode" value="${bindedComponent}"/>
</c:if>
<c:set var="name" value="${targetProps['name'].string}"/>
<jcr:jqom var="res" statement="SELECT * FROM [jnt:cast] where id='${targetNode.name}'"/>


<div class="inner-page">
    <div class="slider-item" style="opacity: 0.7;">
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${res.nodes}" var="cast" end="9">

                    <c:if test="${!empty cast.properties['character'].string && !empty cast.parent.properties['backdrop_path'].string}">
                        <div class="image-block col-sm"
                             style="background: url(${cast.parent.properties['backdrop_path'].string}) no-repeat center top;background-size:cover;">
                            <p><a href="<c:url value="${url.base}${cast.parent.path}.html"/>">
                                    ${cast.parent.properties['jcr:title'].string}</a></p>
                        </div>

                    </c:if>

                </c:forEach>
            </div>

        </div>
    </div>
</div>