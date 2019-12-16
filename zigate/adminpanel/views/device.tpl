% rebase('base.tpl', subtitle='Device ' + str(device))

<h3>Info :</h3>
<table>
  % for k, v in device.info.items():
  	<tr>
    	<td>{{k}}</td>
    	<td>{{v}}</td>
    </tr>
  % end
</table>
<h3>Endpoints :</h3>
% for endpoint_id, endpoint in device.endpoints.items():
<ul>
	<li>Endpoint : {{endpoint_id}}</li>
	<li>Profile ID : {{endpoint.get('profile')}}</li>
	<li>Device ID : {{endpoint.get('device')}}</li>
	<li>In clusters : {{endpoint.get('in_clusters')}}</li>
	<li>Out clusters : {{endpoint.get('out_clusters')}}</li>
</ul>
<table>
	<tr>
		<th>Cluster ID</th>
		<th>Cluster</th>
		<th>Attributes</th>
	</tr>
  	% for cluster_id, cluster in endpoint.get('clusters', {}).items():
  	<tr>
    	<td>{{cluster_id}}</td>
    	<td>{{cluster}}</td>
    	<td>
    	% for attributes in cluster.attributes.values():
    	<ul>
    		% for k, v in attributes.items():
    			<li>{{k}} : {{v}}</li>
    		% end
    	</ul>
    	% end
    	</td>
    </tr>
    % end
</table>
% end