var faceAr=[
{"id":"1","usertype":"doctor","facefile":"team_face1.png"},
{"id":"2","usertype":"doctor","facefile":"team_face10.png"},
{"id":"3","usertype":"doctor","facefile":"team_face11.png"},
{"id":"4","usertype":"doctor","facefile":"team_face12.png"},
{"id":"5","usertype":"doctor","facefile":"team_face13.jpg"},
{"id":"6","usertype":"doctor","facefile":"team_face14.jpg"},
{"id":"7","usertype":"doctor","facefile":"team_face15.jpg"},
{"id":"8","usertype":"doctor","facefile":"team_face16.jpg"},
{"id":"9","usertype":"doctor","facefile":"team_face17.jpg"},
{"id":"10","usertype":"doctor","facefile":"team_face18.jpg"},
{"id":"11","usertype":"doctor","facefile":"team_face19.jpg"},
{"id":"4501","usertype":"doctor","facefile":"team_face2.png"},
{"id":"4502","usertype":"doctor","facefile":"team_face20.jpg"},
{"id":"4503","usertype":"doctor","facefile":"team_face21.jpg"},
{"id":"4504","usertype":"doctor","facefile":"team_face22.jpg"},
{"id":"4505","usertype":"doctor","facefile":"team_face23.jpg"},
{"id":"4506","usertype":"doctor","facefile":"team_face24.jpg"},
{"id":"4507","usertype":"doctor","facefile":"team_face3.png"},
{"id":"4508","usertype":"doctor","facefile":"team_face4.png"},
{"id":"4509","usertype":"doctor","facefile":"team_face5.png"},
{"id":"4510","usertype":"doctor","facefile":"team_face6.png"},
{"id":"4511","usertype":"doctor","facefile":"team_face7.png"},
{"id":"4512","usertype":"doctor","facefile":"team_face8.png"},
{"id":"4513","usertype":"doctor","facefile":"team_face9.png"},
{"id":"4514","usertype":"doctor","facefile":"team_face1.png"},
{"id":"4515","usertype":"doctor","facefile":"team_face10.png"},
{"id":"4516","usertype":"doctor","facefile":"team_face11.png"},
{"id":"4517","usertype":"doctor","facefile":"team_face12.png"},
{"id":"4518","usertype":"doctor","facefile":"team_face13.jpg"},
{"id":"4519","usertype":"doctor","facefile":"team_face14.jpg"},
{"id":"4520","usertype":"doctor","facefile":"team_face15.jpg"},
{"id":"12","usertype":"assistant","facefile":"team_face16.jpg"},
{"id":"13","usertype":"assistant","facefile":"team_face17.jpg"},
{"id":"14","usertype":"assistant","facefile":"team_face18.jpg"},
{"id":"15","usertype":"assistant","facefile":"team_face19.jpg"},
{"id":"16","usertype":"assistant","facefile":"team_face2.png"},
{"id":"17","usertype":"assistant","facefile":"team_face20.jpg"},
{"id":"18","usertype":"assistant","facefile":"team_face21.jpg"},
{"id":"19","usertype":"assistant","facefile":"team_face22.jpg"},
{"id":"20","usertype":"assistant","facefile":"team_face23.jpg"},
{"id":"21","usertype":"assistant","facefile":"team_face24.jpg"},
{"id":"22","usertype":"assistant","facefile":"team_face3.png"},
{"id":"820","usertype":"assistant","facefile":"team_face4.png"},
{"id":"821","usertype":"assistant","facefile":"team_face5.png"},
{"id":"822","usertype":"assistant","facefile":"team_face6.png"},
{"id":"823","usertype":"assistant","facefile":"team_face7.png"},
{"id":"824","usertype":"assistant","facefile":"team_face8.png"},
{"id":"825","usertype":"assistant","facefile":"team_face9.png"},
{"id":"826","usertype":"assistant","facefile":"team_face1.png"},
{"id":"827","usertype":"assistant","facefile":"team_face10.png"},
{"id":"828","usertype":"assistant","facefile":"team_face11.png"},
{"id":"829","usertype":"assistant","facefile":"team_face12.png"},
{"id":"830","usertype":"assistant","facefile":"team_face13.jpg"},
{"id":"831","usertype":"assistant","facefile":"team_face14.jpg"},
{"id":"832","usertype":"assistant","facefile":"team_face15.jpg"},
{"id":"833","usertype":"assistant","facefile":"team_face16.jpg"},
{"id":"834","usertype":"assistant","facefile":"team_face17.jpg"},
{"id":"835","usertype":"assistant","facefile":"team_face18.jpg"},
{"id":"23","usertype":"admin","facefile":"team_face19.jpg"},
{"id":"24","usertype":"admin","facefile":"team_face2.png"},
{"id":"25","usertype":"admin","facefile":"team_face20.jpg"},
{"id":"26","usertype":"admin","facefile":"team_face21.jpg"},
{"id":"27","usertype":"admin","facefile":"team_face22.jpg"},
{"id":"28","usertype":"admin","facefile":"team_face23.jpg"}
];
////////////////////////// DAO
function find( faceAr, id, target)
{
	var tmpObj;
	for(var i=0,l=faceAr.length;i<l;i++){
			tmpObj = faceAr[i];
			if( tmpObj['id'] == id)
				return tmpObj[target];
		}
}
function find_face( id )
{
	file= find(faceAr ,id, 'facefile');
	return (file==undefined)? "user_help.png": file;
}

