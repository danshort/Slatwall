<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfparam name="rc.order" type="any" />
<cfparam name="rc.edit" type="boolean" /> 

<cfsilent>
	<cfset local.saleList = duplicate(rc.order.getOrderItemsSmartList()) />
	<cfset local.saleList.addFilter('orderItemType.systemCode', 'oitSale') />
	
	<cfset local.returnList = duplicate(rc.order.getOrderItemsSmartList()) />
	<cfset local.returnList.addFilter('orderItemType.systemCode', 'oitReturn') />
</cfsilent>
<cfoutput>
	<cfif local.saleList.getRecordsCount() gt 0>
		<h4>#$.slatwall.rbKey('admin.order.ordertabs.orderitems.saleItems')#</h4>
		<cf_HibachiListingDisplay smartList="#local.saleList#"
								   recordDetailAction="admin:entity.detailorderitem"
								   recordDetailQueryString="redirectAction=admin:entity.detailOrder&orderID=#rc.order.getOrderID()#"
								   recordEditAction="admin:entity.editorderitem"
								   recordEditQueryString="redirectAction=admin:entity.detailOrder&orderID=#rc.order.getOrderID()#">
			<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="sku.product.title" />
			<cf_HibachiListingColumn propertyIdentifier="sku.skuCode" />
			<cf_HibachiListingColumn propertyIdentifier="sku.optionsDisplay" sort="false" />
			<cf_HibachiListingColumn propertyIdentifier="orderItemStatusType.type" filter="true" />
			<cf_HibachiListingColumn propertyIdentifier="quantity" />
			<cf_HibachiListingColumn propertyIdentifier="price" />
			<cf_HibachiListingColumn propertyIdentifier="discountAmount" />
			<cf_HibachiListingColumn propertyIdentifier="extendedPriceAfterDiscount" />
			<cf_HibachiListingColumn propertyIdentifier="quantityDelivered" />
		</cf_HibachiListingDisplay>
	</cfif>
	
	<cfif local.returnList.getRecordsCount() gt 0>
		<h4>#$.slatwall.rbKey('admin.order.ordertabs.orderitems.returnItems')#</h4>
		<cf_HibachiListingDisplay smartList="#local.returnList#"
								   recordDetailAction="admin:entity.detailorderitem"
								   recordEditAction="admin:entity.editorderitem">
			<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="sku.product.title" />
			<cf_HibachiListingColumn propertyIdentifier="sku.skuCode" />
			<cf_HibachiListingColumn propertyIdentifier="sku.optionsDisplay" sort="false" />
			<cf_HibachiListingColumn propertyIdentifier="orderItemStatusType.type" filter="true" />
			<cf_HibachiListingColumn propertyIdentifier="quantity" />
			<cf_HibachiListingColumn propertyIdentifier="price" />
			<cf_HibachiListingColumn propertyIdentifier="discountAmount" />
			<cf_HibachiListingColumn propertyIdentifier="extendedPriceAfterDiscount" />
			<cf_HibachiListingColumn propertyIdentifier="quantityReceived" />
		</cf_HibachiListingDisplay>
	</cfif>
	
	<cf_HibachiActionCaller action="admin:entity.createorderitem" class="btn btn-inverse" icon="plus icon-white" queryString="orderID=#rc.order.getOrderID()#" modal=true />
</cfoutput>