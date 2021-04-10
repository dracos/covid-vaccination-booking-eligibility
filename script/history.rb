
require 'open-uri'
require('./lib/criteria_extractor')
require 'json'

february = ["20210208165130", "20210208165841","20210208170204","20210208170205","20210208171331","20210208171701","20210208171701","20210208171701","20210208192414","20210208194856","20210208200846","20210209093519","20210209095707","20210209101806","20210209102054","20210209105839","20210209110028","20210209110052","20210209112237","20210209123832","20210209124032","20210209124138","20210209133736","20210209140222","20210209155859","20210209160228","20210209172030","20210209172031","20210209172031","20210209172439","20210209172439","20210209172439","20210209195051","20210210002714","20210210053539","20210210090031","20210210090031","20210210090031","20210210090108","20210210090108","20210210090108","20210210090117","20210210090117","20210210090117","20210210093643","20210210100259","20210210104032","20210210120027","20210210132343","20210210135359","20210210143053","20210210143645","20210210152336","20210210155703","20210210160153","20210210160333","20210210162233","20210210171029","20210210173030","20210210175000","20210210175000","20210210175054","20210210175412","20210210194042","20210210213723","20210210213723","20210211034631","20210211040523","20210211053722","20210211060741","20210211062304","20210211063816","20210211071937","20210211080554","20210211092018","20210211105011","20210211120242","20210211120735","20210211120933","20210211120933","20210211132445","20210211154050","20210211155048","20210212032450","20210212032451","20210212032452","20210212043048","20210212110105","20210212110228","20210212110436","20210212110437","20210212110520","20210212174515","20210212182726","20210212213606","20210213120510","20210213121037","20210213122355","20210213123445","20210213123449","20210213140032","20210213140032","20210213142211","20210214013417","20210214063825","20210214100359","20210214112123","20210214160238","20210214160638","20210214162156","20210214162204","20210214165241","20210214165252","20210214185056","20210214192126","20210214195211","20210214200705","20210214203745","20210214204221","20210214211840","20210214213857","20210215062947","20210215062949","20210215130208","20210215135452","20210215140118","20210215140122","20210215140128","20210215142820","20210215150802","20210215152300","20210215152350","20210215152603","20210215155446","20210215160911","20210215174540","20210215180942","20210215181952","20210215183447","20210215183455","20210215185024","20210215192148","20210215200814","20210215203920","20210215205432","20210215224950","20210216055056","20210216062125","20210216073831","20210216075334","20210216081927","20210216083550","20210216090428","20210216091129","20210216091628","20210216113944","20210216114308","20210216140234","20210216143829","20210216150126","20210216150131","20210216150140","20210216170423","20210216170655","20210216170655","20210216170656","20210216183809","20210216215838","20210217065234","20210217090707","20210217090707","20210217141410","20210217150057","20210217150058","20210217151048","20210217151049","20210217151050","20210217165805","20210217193658","20210218081013","20210218091847","20210218100101","20210218120740","20210218144601","20210218144606","20210218150316","20210218152556","20210218170710","20210218173418","20210218174947","20210218174947","20210219070902","20210219091118","20210219095415","20210219120919","20210219122832","20210219123005","20210219123023","20210219145054","20210219155322","20210219163021","20210219173713","20210219183923","20210219190557","20210220073043","20210220090034","20210220110111","20210220123532","20210220133706","20210221131910","20210222100136","20210222101205","20210222140758","20210222153031","20210222161559","20210222180110","20210222180225","20210222205227","20210223081703","20210223084758","20210223085237","20210223100105","20210223104639","20210223110128","20210223110759","20210223115228","20210223115626","20210223130205","20210223160831","20210223202507","20210223204207","20210223212422","20210224115002","20210224125320","20210224224530","20210224230957","20210225075649","20210225075649","20210225075649","20210225082833","20210225095307","20210225122326","20210225140724","20210225164522","20210225164522","20210225164522","20210225182324","20210225193557","20210225224715","20210226061911","20210226102100","20210226135219","20210226173712","20210226175258","20210226201257","20210226203209","20210226203811","20210226234954","20210227053455","20210227053455","20210227053455","20210227094731","20210228055420","20210228093011","20210228105928","20210228131203","20210228131204","20210228131204","20210228192049"]


march = ["20210301015833","20210301015833","20210301081321","20210301091601","20210301091750","20210301091853","20210301113101","20210301113142","20210301122248","20210301135534","20210301170905","20210301180533","20210301182151","20210301201222","20210302090049","20210302100047","20210302101122","20210302105848","20210302114058","20210302114059","20210302133728","20210302152155","20210302164031","20210302171523","20210303090037","20210303121811","20210303121811","20210303121811","20210303121811","20210303133509","20210303134747","20210303161507","20210303162106","20210303162854","20210303192458","20210303193145","20210303211138","20210304100043","20210304105202","20210304105202","20210304105202","20210304110110","20210304160120","20210304175322","20210305163113","20210305180154","20210305200048","20210305200049","20210305200049","20210306003228","20210306063607","20210306090850","20210306104016","20210306110220","20210306120724","20210306125739","20210306150151","20210306151858","20210306151858","20210306151859","20210306213831","20210306214320","20210306215351","20210306220851","20210306221918","20210306223421","20210306224938","20210306230449","20210306232003","20210306233514","20210306235029","20210307000125","20210307000549","20210307002103","20210307005128","20210307012156","20210307013703","20210307020724","20210307023750","20210307025302","20210307045247","20210307083020","20210307103451","20210307123720","20210307135703","20210307135703","20210307135703","20210307150459","20210307183053","20210307222317","20210308020654","20210308093610","20210308094925","20210308095145","20210308095146","20210308102221","20210308105310","20210308110321","20210308111912","20210308122147","20210308123641","20210308125214","20210308130720","20210308130722","20210308133843","20210308135355","20210308135403","20210308140920","20210308141951","20210308160807","20210308163925","20210308165459","20210308173333","20210308184053","20210308204006","20210308212952","20210309003914","20210309063031","20210309081007","20210309120230","20210309125158","20210309173701","20210309190416","20210309194801","20210309194801","20210309194801","20210309204053","20210309204053","20210310041820","20210310073815","20210310084012","20210310084012","20210310120102","20210310122219","20210310170116","20210310190103","20210311070845","20210311080515","20210311122300","20210311124452","20210311165310","20210311172358","20210311195132","20210312040520","20210312083320","20210312092339","20210312105440","20210312110144","20210312120116","20210312150838","20210312151355","20210312171309","20210312235919","20210313121145","20210314064941","20210314193648","20210315101014","20210315130600","20210315130600","20210315130600","20210315143938","20210315145443","20210315160055","20210315233613","20210316015842","20210316083747","20210316094215","20210316094341","20210316112242","20210316130448","20210316141929","20210316152049","20210316153535","20210316153535","20210316153535","20210317070040","20210317082457","20210317084619","20210317092717","20210317103855","20210317104535","20210317110947","20210317112017","20210317112841","20210317113556","20210317115129","20210317120705","20210317122155","20210317123803","20210317125335","20210317130314","20210317130832","20210317131957","20210317134039","20210317140617","20210317142210","20210317143111","20210317143800","20210317150917","20210317152851","20210317152851","20210317152851","20210317152906","20210317152906","20210317152907","20210317153943","20210317155202","20210317170826","20210317182105","20210317185151","20210317195349","20210317203515","20210317210604","20210317220847","20210318003736","20210318014938","20210318024816","20210318055403","20210318061955","20210318094521","20210318101610","20210318104521","20210318125123","20210318140213","20210318150139","20210318150139","20210318150139","20210318173049","20210318173049","20210318184604","20210318203047","20210318203657","20210318203717","20210318203722","20210318225102","20210319000524","20210319055256","20210319062324","20210319082137","20210319100957","20210319132527","20210319145525","20210319165527","20210319180149","20210319180159","20210319180204","20210319180214","20210319180219","20210319193613","20210320034755","20210320120041","20210320140354","20210320191401","20210320191401","20210321103340","20210321130050","20210321133542","20210321140131","20210321160105","20210321160106","20210321160142","20210321160202","20210321173115","20210321200856","20210321235402","20210322090047","20210322091543","20210322101016","20210322165400","20210322172144","20210322234751","20210323015404","20210323015404","20210323015404","20210323020534","20210323070040","20210323070054","20210323090213","20210323090213","20210323090214","20210323103028","20210323110025","20210323110109","20210323214526","20210323214526","20210324011831","20210324080717","20210324100055","20210324100116","20210324101244","20210324103109","20210324110025","20210324121741","20210324121904","20210324122001","20210324170238","20210324170524","20210324172259","20210324173518","20210324174020","20210324180246","20210324183543","20210324190132","20210324195514","20210324195514","20210324195514","20210324210551","20210324224926","20210325015227","20210325033456","20210325052220","20210325053406","20210325083742","20210325111037","20210325112311","20210325115514","20210325123130","20210325131215","20210325150206","20210325160227","20210325163615","20210325173855","20210325212053","20210326082256","20210326090240","20210326090247","20210326090255","20210326090259","20210326104519","20210326113316","20210326113316","20210326113316","20210326113411","20210326113411","20210326113411","20210326113439","20210326113439","20210326113440","20210326120821","20210326124027","20210326130545","20210326133532","20210326133559","20210326133559","20210326133559","20210326140732","20210326145420","20210326150957","20210326160729","20210326163130","20210326163130","20210326163130","20210326173132","20210326175131","20210326183844","20210326200053","20210327080108","20210327091930","20210327100051","20210327140139","20210327170041","20210327170043","20210327170044","20210327170103","20210328080055","20210328110742","20210328113413","20210328120122","20210328121022","20210328123452","20210328150055","20210328150102","20210328150119","20210328150121","20210329070051","20210329070104","20210329070221","20210329070543","20210329070610","20210329085508","20210329143747","20210329164247","20210329170831","20210330000412","20210330000412","20210330043104","20210330043104","20210330131823","20210330132027","20210330132050","20210330135818","20210330155123","20210330160755","20210331082511","20210331090215","20210331122019","20210331135524","20210331152613","20210331153702","20210331180820"]

april = ["20210401021240","20210401100021","20210401100123","20210401100127","20210401100136","20210401100139","20210401100217","20210401145033","20210401162455","20210401162900","20210401183152","20210401183152","20210401183152","20210402161529","20210403100054","20210403100122","20210403100136","20210403100159","20210403173037","20210404204354","20210405083019","20210405103027","20210405122255","20210405183035","20210406113532","20210406120026","20210406121607","20210406140249","20210406154023","20210406170914","20210407070016","20210407113613","20210407125428","20210407133151","20210407133304","20210407133621","20210407184523","20210407233702","20210408091005","20210408102618","20210408131627","20210408140648","20210409100847","20210409102217","20210409110206"]

urls = february + march + april

history = urls.map do |timestamp|
  url = "https://web.archive.org/web/#{timestamp}/https://www.nhs.uk/conditions/coronavirus-covid-19/coronavirus-vaccination/book-coronavirus-vaccination/"

  page = URI.parse(url).open.read

  criteria_extractor = CriteriaExtractor.new(page)

  {
    updated_at: criteria_extractor.updated_at.to_i,
    criteria: criteria_extractor.criteria
  }
end

puts JSON.pretty_generate(history.sort{|a, b| a[:updated_at] <=> b[:updated_at]}.uniq{|h| h[:criteria]})
