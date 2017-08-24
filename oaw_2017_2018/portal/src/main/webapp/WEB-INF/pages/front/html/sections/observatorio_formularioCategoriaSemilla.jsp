<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.inteco.common.Constants"%>
<html:xhtml />
<html:javascript formName="CategoriaForm" />

<link rel="stylesheet" href="/oaw/js/jqgrid/css/ui.jqgrid.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.ui-jqgrid-htable, #grid {
	border: none !Important;
	margin: 0 !Important;
	font-size: 14px !Important;
}

.ui-jqgrid .ui-jqgrid-bdiv {
	overflow-x: hidden !Important;
	overflow-y: auto !Important;;
}

.ui-th-ltr, .ui-jqgrid .ui-jqgrid-htable th.ui-th-ltr {
	padding: 1%;
	font-weight: bold;
}

.ui-jqgrid .ui-jqgrid-bdiv tr.ui-row-ltr>td {
	padding: 5px;
}

.ui-jqgrid {
	clear: both;
}

/* Para evitar el parpadeo al recargar */
.ui-jqgrid-bdiv {
	/*min-height: 500px !Important;*/
	
}
</style>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/oaw/js/jqgrid/jquery.jqgrid.src.js"></script>
<script src="/oaw/js/jqgrid/i18n/grid.locale-es.js"
	type="text/javascript"></script>
<script src="/oaw/js/gridSemillas.js" type="text/javascript"></script>


<script type="text/javascript">
	$(window)
			.on(
					'load',
					function() {

						if ($('[name=id]').val() != null
								&& $('[name=id]').val() != "") {

							var $jq = $.noConflict();

							//Primera carga del grid el grid
							$jq(document)
									.ready(
											function() {
												reloadGrid('JsonSemillasObservatorio.do?action=buscar&categoria='
														+ $('[name=id]').val());
											});
						}

					});
</script>

<logic:present parameter="<%=Constants.ID_CATEGORIA%>">
	<bean:parameter name="<%=Constants.ID_CATEGORIA %>" id="idcat" />
</logic:present>

<div id="dialogoNuevaSemilla" style="display: none">
	<jsp:include page="./observatorio_nuevaSemilla_multidependencia.jsp" />

</div>

<!-- observatorio_formularioCategoriaSemilla.jsp -->
<div id="main">

	<div id="container_menu_izq">
		<jsp:include page="menu.jsp" />
	</div>

	<div id="container_der">

		<div id="migas">
			<p class="sr-only">
				<bean:message key="ubicacion.usuario" />
			</p>
			<ol class="breadcrumb">
				<li><html:link forward="observatoryMenu">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						<bean:message key="migas.observatorio" />
					</html:link></li>
				<li><html:link forward="getSeedCategories">
						<bean:message key="migas.categoria" />
					</html:link></li>
				<li class="active"><logic:equal
						parameter="<%=Constants.ACTION%>"
						value="<%=Constants.NEW_SEED_CATEGORY%>">
						<bean:message key="migas.nueva.categoria" />
					</logic:equal> <logic:equal parameter="<%=Constants.ACTION%>"
						value="<%=Constants.EDIT_SEED_CATEGORY%>">
						<bean:message key="migas.modificar.categoria" />
					</logic:equal></li>
			</ol>
		</div>

		<div id="cajaformularios">
			<h2>
				<bean:message key="categoria.semillas.titulo" />
			</h2>

			<div id="exitosNuevaSemillaMD" style="display: none"></div>

			<p>
				<bean:message key="categoria.semillas.fichero.info">
					<jsp:attribute name="arg0">
                            <a href="../xml/seeds.xml"
							title="<bean:message key="categoria.semillas.fichero.ejemplo.title"/>"><bean:message
								key="categoria.semillas.fichero.ejemplo" /></a>
                        </jsp:attribute>
				</bean:message>
			</p>
			<p>
				<bean:message key="leyenda.campo.obligatorio" />
			</p>

			<html:form styleClass="formulario form-horizontal" method="post"
				action="/secure/SeedCategoriesAction" enctype="multipart/form-data"
				onsubmit="return validateCategoriaForm(this)">
				<html:hidden property="id" />
				<input type="hidden" name="<%=Constants.ACTION%>"
					value="<bean:write name="<%=Constants.ACTION%>"/>" />
				<fieldset>
					<jsp:include page="/common/crawler_messages.jsp" />
					<div class="formItem">
						<label for="name" class="control-label"><strong
							class="labelVisu"><acronym
								title="<bean:message key="campo.obligatorio" />"> * </acronym> <bean:message
									key="migas.categoria" />: </strong></label>
						<html:text styleClass="texto form-control" property="name"
							styleId="name" maxlength="30" />
					</div>
					<div class="formItem">
						<label for="orden" class="control-label"><strong
							class="labelVisu"><bean:message
									key="categoria.semillas.orden" />: </strong></label>
						<html:select styleClass="textoSelect form-control" styleId="orden"
							property="orden">
							<option value="1"
								<c:if test="${CategoriaForm.orden==1}">selected="selected"</c:if>>1</option>
							<option value="2"
								<c:if test="${CategoriaForm.orden==2}">selected="selected"</c:if>>2</option>
							<option value="3"
								<c:if test="${CategoriaForm.orden==3}">selected="selected"</c:if>>3</option>
							<option value="4"
								<c:if test="${CategoriaForm.orden==4}">selected="selected"</c:if>>4</option>
							<option value="5"
								<c:if test="${CategoriaForm.orden==5}">selected="selected"</c:if>>5</option>
							<option value="6"
								<c:if test="${CategoriaForm.orden==6}">selected="selected"</c:if>>6</option>
							<option value="7"
								<c:if test="${CategoriaForm.orden==7}">selected="selected"</c:if>>7</option>
							<option value="8"
								<c:if test="${CategoriaForm.orden==8}">selected="selected"</c:if>>8</option>
							<option value="9"
								<c:if test="${CategoriaForm.orden==9}">selected="selected"</c:if>>9</option>
							<option value="10"
								<c:if test="${CategoriaForm.orden==10}">selected="selected"</c:if>>10</option>
						</html:select>
					</div>
					<div class="formItem">
						<label for="fileSeeds" class="control-label"><strong
							class="labelVisu"><bean:message
									key="categoria.semillas.fichero" />: </strong></label>
						<html:file styleClass="texto" property="fileSeeds"
							styleId="fileSeeds" />
					</div>
					<div class="formButton">
						<html:submit styleClass="btn btn-primary btn-lg">
							<bean:message key="boton.aceptar" />
						</html:submit>
					</div>
				</fieldset>
			</html:form>

			<logic:present name="<%=Constants.ID_CATEGORIA%>">
				<%-- 								<p class="pull-right">
					<html:link forward="newCategorySeed"
						styleClass="btn btn-default btn-lg"
						paramName="<%=Constants.ID_CATEGORIA%>"
						paramId="<%=Constants.ID_CATEGORIA%>">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"
							data-toggle="tooltip" title="Crear una nueva semilla"></span>
						<span class="sr-only>"><bean:message
								key="categoria.semillas.nueva.semilla" /></span>
					</html:link>
				</p>  --%>

				<p class="pull-right">
					<a href="#" class="btn btn-default btn-lg"
						onclick="dialogoNuevaSemilla()"> <span
						class="glyphicon glyphicon-plus" aria-hidden="true"
						data-toggle="tooltip" title=""
						data-original-title="Crear una semilla"></span> <bean:message
							key="cargar.semilla.observatorio.nueva.semilla" />
					</a>
				</p>

			</logic:present>


			<!-- Grid -->
			<table id="grid">
			</table>



			<p id="paginador"></p>




			<%--                 <logic:notEmpty name="<%=Constants.CATEGORIA_FORM %>" property="seeds">
                    <div class="pag">
                        <table class="table table-stripped table-bordered table-hover">
                            <caption><bean:message key="categoria.semillas.lista.semillas"/></caption>
                            <tr>
                                <th><bean:message key="categoria.semillas.nombre"/></th>
                                <th class="accion">Ir</th>
                                <th class="accion">Eliminar</th>
                            </tr>
                            <logic:iterate name="<%=Constants.CATEGORIA_FORM %>" property="seeds" id="seed">
                                <jsp:useBean id="params" class="java.util.HashMap" />
                                <c:set target="${params}" property="idcat" value="${CategoriaForm.id}" />
                                <c:set target="${params}" property="idSemilla" value="${seed.id}" />
                                <tr>
                                    <td style="text-align: left">
                                        <html:link forward="editCategorySeed" name="params">
                                            <span data-toggle="tooltip" title="Editar esta semilla"><bean:write name="seed" property="nombre"/></span>
                                        </html:link>
                                        <span class="glyphicon glyphicon-edit pull-right edit-mark" aria-hidden="true" />
                                    </td>
                                    <td>
                                        <logic:iterate name="seed" property="listaUrls" id="url" length="1">
                                            <bean:define id="altLink">
                                                <bean:message key="categoria.semillas.enlace.externo">
                                                    <jsp:attribute name="arg0">
                                                        <bean:write name="seed" property="nombre"/>
                                                    </jsp:attribute>
                                                </bean:message>
                                            </bean:define>

                                            <a href="<bean:write name="url"/>" title="<%=altLink %>">
                                                <span class="glyphicon glyphicon-new-window"></span>
                                                <span class="sr-only">Ir a la p&aacute;gina web de esta semilla</span>
                                            </a>
                                        </logic:iterate>
                                    </td>
                                    <td>
                                        <html:link forward="deleteCategorySeedConfirmation" name="params">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true" data-toggle="tooltip" title="Eliminar esta semilla"/>
                                            <span class="sr-only"><bean:message key="indice.rastreo.img.eliminar.rastreo.alt" /></span>
                                        </html:link>
                                    </td>
                                </tr>
                            </logic:iterate>
                        </table>
                        <jsp:include page="pagination.jsp" />
                    </div>
                    <p id="pCenter"><html:link forward="observatoryMenu" styleClass="btn btn-default btn-lg"><bean:message key="boton.volver" /></html:link></p>
                </logic:notEmpty> --%>
		</div>
	</div>
</div>

