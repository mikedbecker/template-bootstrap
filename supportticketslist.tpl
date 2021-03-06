<div class="page-header">
	<h1>{$LANG.clientareanavsupporttickets} <small>{$LANG.supportticketsintro}</small></h1>
</div>

<form class="pull-right form-inline well well-small" action="supporttickets.php" method="get">
	<input type="text" name="searchterm" class="span3" value="{if $searchterm}{$searchterm}{/if}" placeholder="{$LANG.searchtickets}">
	<button type="submit" class="btn btn-success">{$LANG.search}</button>
</form>

<a href="submitticket.php" class="btn marginbottom" title="{$LANG.opennewticket}">{$LANG.opennewticket}</a>

<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<table class="table table-bordered-outside table-striped table-sorted">
	<thead>
		<tr>
			<th{if $orderby eq "date"} class="sort-{$sort}"{/if}><a href="supporttickets.php?orderby=date" title="{$LANG.supportticketsdate}">{$LANG.supportticketsdate}</a></th>
			<th{if $orderby eq "dept"} class="sort-{$sort}"{/if}><a href="supporttickets.php?orderby=dept" title="{$LANG.supportticketsdepartment}">{$LANG.supportticketsdepartment}</a></th>
			<th{if $orderby eq "subject"} class="sort-{$sort}"{/if}><a href="supporttickets.php?orderby=subject" title="{$LANG.supportticketssubject}">{$LANG.supportticketssubject}</a></th>
			<th{if $orderby eq "status"} class="sort-{$sort}"{/if}><a href="supporttickets.php?orderby=status" title="{$LANG.supportticketsstatus}">{$LANG.supportticketsstatus}</a></th>
			<th{if $orderby eq "lastreply"} class="sort-{$sort}"{/if}><a href="supporttickets.php?orderby=lastreply" title="{$LANG.supportticketsticketlastupdated}">{$LANG.supportticketsticketlastupdated}</a></th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
{foreach key=num item=ticket from=$tickets}
		<tr>
			<td>{$ticket.date}</td>
			<td>{$ticket.department}</td>
			<td><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
			<td>{$ticket.status}</td>
			<td>{$ticket.lastreply}</td>
			<td class="textcenter"><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" title="{$LANG.supportticketsviewticket} {$ticket.tid}" class="btn btn-inverse">{$LANG.supportticketsviewticket}</a></td>
		</tr>
{foreachelse}
		<tr>
			<td colspan="7" class="textcenter">{$LANG.norecordsfound}</td>
		</tr>
{/foreach}
	</tbody>
</table>

<form method="post" action="supporttickets.php" class="pull-right">
	<fieldset>
		<select name="itemlimit" onchange="submit()">
			<option>{$LANG.resultsperpage}</option>
			<option value="10"{if $itemlimit==10} selected="selected"{/if}>10</option>
			<option value="25"{if $itemlimit==25} selected="selected"{/if}>25</option>
			<option value="50"{if $itemlimit==50} selected="selected"{/if}>50</option>
			<option value="100"{if $itemlimit==100} selected="selected"{/if}>100</option>
			<option value="all"{if $itemlimit==99999999} selected="selected"{/if}>{$LANG.clientareaunlimited}</option>
		</select>
	</fieldset>
</form>

<div class="pagination">
	<ul>
		<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}supporttickets.php?page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
		<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}supporttickets.php?page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
	</ul>
</div>
