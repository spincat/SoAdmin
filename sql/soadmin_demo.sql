/*
Navicat MySQL Data Transfer

Source Server         : hanbud
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : soadmin_demo

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-06-13 21:18:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `cont` varchar(1000) NOT NULL,
  `clientip` varchar(20) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT '0',
  `replycont` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('20', 'miqic911@gmail.com', '反馈提交测试', '127.0.0.1', '1375706091', '2', '爱 看看那');
INSERT INTO `feedback` VALUES ('29', 'test@admin.com', '大愿法师在致辞中说到：本届文化节以华严文化为载体，以推动华严文化复兴、助力文化强省建设为主题，以慈行慈爱、传播正能量为宗旨。“高高山顶立、深深海底行”，“善用其心、善行其事”，智行双运是华严文化的精神。他还谈到世界和平的保障是人心和平，人心没有种族的偏见，没有不同文化的偏见和差异。华严讲六相圆融，要圆融不要对立，这些从根本上有利于世界和平。华严文化是一个无尽的世界宝藏，对于净化内心、提升人格、清明吏治、遏制腐败、改善民风、稳定社会等等有重要的指导意义。', '127.0.0.1', '1385883513', '2', '回复试试///');
INSERT INTO `feedback` VALUES ('27', 'miqic911@gmail.com', '新的反馈', '127.0.0.1', '1385548420', '2', '不可思议 邮件发送的工作居然完成了！');
INSERT INTO `feedback` VALUES ('28', 'dfsdfsfds@qq.com', '反馈测试', '127.0.0.1', '1385820947', '2', '又是一个新的回复测试。');
INSERT INTO `feedback` VALUES ('30', 'f6652140@126.com', '听说你们的意见反馈模块写成功了？', '127.0.0.1', '1385997870', '2', '那是当然，用了一天就全部写好了～！');
INSERT INTO `feedback` VALUES ('31', 'f6652140@126.com', '反馈错误测试', '127.0.0.1', '1386294600', '2', '反馈成功测试');
INSERT INTO `feedback` VALUES ('32', 'f6652140@126.com', 'Godaddy 邮箱反馈测试', '127.0.0.1', '1386319491', '2', '无加密测试');
INSERT INTO `feedback` VALUES ('33', 'f6652140@126.com', '太空站模式测试', '127.0.0.1', '1386340003', '2', '太空站回复测试');
INSERT INTO `feedback` VALUES ('35', 'miqic911@gmail.com', '反馈测试', '127.0.0.1', '1386409100', '2', '反馈DEBUG=true');
INSERT INTO `feedback` VALUES ('39', 'miqic911@gmail.com', 'test', '127.0.0.1', '1386610186', '1', null);
INSERT INTO `feedback` VALUES ('38', 'f6652140@126.com', 'Access-Control-Allow-Origin', '127.0.0.1', '1386513822', '1', null);
INSERT INTO `feedback` VALUES ('40', 'miqic911@gmail.com', 'asda', '192.168.1.100', '1394687060', '2', '再回复测试\n');
INSERT INTO `feedback` VALUES ('41', 'miqic911@gmail.com', '反侧的测试', '192.168.1.101', '1395639755', '2', '会爱仕达\n');
INSERT INTO `feedback` VALUES ('42', 'asdasd@126.com', '反馈一下吧', '192.168.1.101', '1395666667', '0', null);
INSERT INTO `feedback` VALUES ('43', 'miqic911@gmail.com', '反馈内容测试', '127.0.0.1', '1400666187', '2', '你好，感谢您的回复，我们将尽快安排人员为你处理。');
INSERT INTO `feedback` VALUES ('44', 'miqic911@gmail.com', 'IE8反馈的测试', '127.0.0.1', '1400685833', '1', null);

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `imgurl` varchar(100) NOT NULL,
  `cont` varchar(200) NOT NULL,
  `source` varchar(100) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '2013-08-11', '/images/demo/1377566396710.jpg', '善法要长期，就像我们吃饭一样，断一天也不行，必须要长期熏陶在善法的氛围中。', '《亲友书》', 'admin');
INSERT INTO `info` VALUES ('3', '2013-08-12', '/images/demo/1377566354929.jpg', '破戒之人。结使风强。散乱其心。则禅不可得。持戒之人。烦恼风软。心不大散。禅定易得。', '《大智度论》', 'admin');
INSERT INTO `info` VALUES ('5', '2013-08-10', '/images/demo/1377565819456.jpg', '恶知识者有四辈。一內有怨心。外强为知识。二于人前好言语。背后说人恶。三有急时于人前愁苦。背后欢喜。四外如亲厚。內兴怨谋。', '《尸迦罗越六向拜经》', 'admin');
INSERT INTO `info` VALUES ('6', '2013-08-14', '/images/demo/1377564901156.jpg', '一切世界皆有三种人。下中上。下人。着现世乐。中人。求后世乐。上人。求道。有慈悲心。怜愍众生。', '《大智度论》', 'admin');
INSERT INTO `info` VALUES ('7', '2013-08-15', '/images/demo/1376659754359.jpg', '一切众生。皆有性净。是故于彼。勿生下劣。应当尊重。彼即我师。如法恭敬。', '《胜天王般若波罗蜜经》', 'admin');
INSERT INTO `info` VALUES ('8', '2013-08-16', '/images/demo/1376659872404.jpg', '众生与佛，本来无二，所谓心佛及众生，是三无差别，但心净是佛，心垢即众生，生佛之辨不远，只在心垢灭与不灭耳。', '《净宗法要》', 'admin');
INSERT INTO `info` VALUES ('9', '2013-08-27', '/images/demo/1377533608781.jpg', '若常愁苦。愁遂增长。如人喜眠，眠则滋长。若常烦恼。烦恼滋多。', '《涅槃经》', 'admin');
INSERT INTO `info` VALUES ('10', '2013-08-26', '/images/demo/1377564843330.jpg', '若无菩萨性。虽付发心。勤修精进。终不能令得阿耨多罗三藐三菩提。', '《善戒经》', 'admin');
INSERT INTO `info` VALUES ('11', '2013-08-28', '/images/demo/1377706257748.jpg', '若勤精进。则事无难者。是故汝等。常勤精进。譬如小水常流。则能穿石。', '《佛遗教经》', 'admin');
INSERT INTO `info` VALUES ('12', '2013-08-29', '/images/demo/1377994271697.jpg', '佛告迦叶。世间乐者。彼则是苦。于彼出离。如是业尽得解脱。', '《大法鼓经》', 'admin');
INSERT INTO `info` VALUES ('13', '2013-08-30', '/images/demo/1377994465841.jpg', '佛告比丘。复于七法。令法增长。无有损耗。何谓为七。一者敬佛。二者敬法。三者敬僧。四者敬戒。五者敬定。六者敬顺父母。七者敬不放逸。如是七法。则法增长。无有损耗。', '《长阿含》', 'admin');
INSERT INTO `info` VALUES ('14', '2013-08-31', '/images/demo/1377994728538.jpg', '既不求利养名闻，又不贪欲乐果报，唯为生死，为菩提。如是发心，名之为正。', '《劝发菩提心文》', 'admin');
INSERT INTO `info` VALUES ('15', '2013-09-01', '/images/demo/1378200010567.jpg', '一切众生悉有佛性。无量相好庄严照明。以彼性故。一切众生得般涅槃。', '《大法鼓经》', 'admin');
INSERT INTO `info` VALUES ('16', '2013-09-02', '/images/demo/1378200167813.jpg', '不负债及悭。斯名为下乐。有财行布施。此名为中乐。身口意业净。智慧乐多闻。此则为上乐。慧者之所行。', '《大般涅槃经》', 'admin');
INSERT INTO `info` VALUES ('17', '2013-10-01', '/images/demo/1381979791678.jpg', '一切法中。心为上首。若善知心。悉解众法。', '《胜天王般若波罗蜜经》', 'admin');
INSERT INTO `info` VALUES ('18', '2013-10-02', '/images/demo/1381983918935.jpg', '善生，当知饮酒有六失：一者失财，二者生病，三者斗诤，四者恶名流布，五者恚怒暴生，六者智慧日损。善生，若彼长者、长者子，饮酒不已，其家产业，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('19', '2013-10-03', '/images/demo/1381984120430.jpg', '善生，博戏有六失。云何为六？一者财产日耗，二者虽胜生怨，三者智者所责，四者人不敬信，五者为人疏外，六者生盗窃心。善生，是为博戏六失。若长者、长者子，博戏不已，其家产业，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('20', '2013-10-04', '/images/demo/1381984780430.jpg', '放荡有六失：一者不自护身，二者不护财货，三者不护子孙，四者常自惊惧，五者诸苦恶法常自缠身，六者喜生虚妄，是为放荡六失。若长者、长者子，放荡不已，其家财产，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('21', '2013-10-05', '/images/demo/1381985055456.jpg', '恶友相得复有六失：一者方便生欺，二者好喜屏处，三者诱他家人，四者图谋他物，五者财利自向，六者好发他过，是为恶友六失。若长者、长者子，习恶友不已，其家财产，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('22', '2013-10-06', '/images/demo/1381985354597.jpg', '懈惰有六失：一者富乐不肯作务，二者贫穷不肯勤修，三者寒时不肯勤修，四者热时不肯勤修，五者时早不肯勤修，六者时晚不肯勤修，是为懈惰六失。若长者、长者子，懈惰不已，其家财业，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('23', '2013-10-07', '/images/demo/1381985715980.jpg', '善生，迷于伎乐复有六失：一者求歌，二者求舞，三者求琴瑟，四者波内卑，五者多罗槃，六者首呵那，是为伎乐六失。若长者、长者子，伎乐不已，其家财产，日日损减。', '《佛说善生经》', 'admin');
INSERT INTO `info` VALUES ('24', '2013-10-08', '/images/demo/1381986479949.jpg', '若有贫穷人。信心少嗔恨。常生惭愧心。惠施离悭垢。见沙门梵志。持戒多闻者。谦虚而问讯。随宜善供给。劝人令施与。叹施及受者。如是修善人。从此至他世。善趣上生天。从冥而入明。', '《杂阿含经》', 'admin');
INSERT INTO `info` VALUES ('25', '2013-10-09', '/images/demo/1381986932720.jpg', '菩萨于法。应无所住行于布施。所谓不住色布施。不住声香味触法布施。须菩提！菩萨应如是布施。不住于相。何以故？若菩萨不住相布施。其福德不可思量。', '《金刚般若波罗蜜经》', 'admin');
INSERT INTO `info` VALUES ('26', '2013-10-10', '/images/demo/1381987442761.jpg', '我如良医。知病说药。服与不服。非医咎也。又如善导。导入正道。闻之不行。非导过也。', '《佛遗教经》', 'admin');
INSERT INTO `info` VALUES ('27', '2013-10-11', '/images/demo/1381987944530.jpg', '佛言。学佛道者。佛所言说。皆应信顺。譬如食蜜。中边皆甜。吾经亦尔。', '《四十二章经》', 'admin');
INSERT INTO `info` VALUES ('28', '2013-10-12', '/images/demo/1381988175902.jpg', '应于自身生病苦想。于善知识生医王想。于所说法生良药想。于所修行生除病想。', '《大方广佛华严经》', 'admin');
INSERT INTO `info` VALUES ('29', '2013-10-13', '/images/demo/1381988831273.jpg', '如狮子身中虫。自食狮子肉。非余外虫。如是佛子自破佛法。非外道天魔能破。', '《梵网经》', 'admin');
INSERT INTO `info` VALUES ('30', '2013-10-14', '/images/demo/1381991428520.jpg', '无有法菩萨所不应学者。何以故。若菩萨不学一切法。不能得一切种智。', '《摩诃般若波罗密经》', 'admin');
INSERT INTO `info` VALUES ('31', '2013-10-15', '/images/demo/1381991635591.jpg', '佛法可自证知。不可以已所证传于他人。如财物等。如《婆罗延经》中佛言。我不能自断汝疑。能证我法。汝疑自断。', '《成实论》', 'admin');
INSERT INTO `info` VALUES ('32', '2013-10-16', '/images/demo/1381991845703.jpg', '以人食羊。羊死为人。人死为羊。如是乃至。十生之类。死死生生。互来相噉。恶业俱生。穷未来际。', '《楞严经》', 'admin');
INSERT INTO `info` VALUES ('33', '2013-10-17', '/images/demo/1381992136180.jpg', '千劫所作。极重恶业。若能至心忏悔者。如是重罪。悉皆灭尽。', '《金光明经》', 'admin');
INSERT INTO `info` VALUES ('34', '2013-10-18', '/images/demo/1382072855898.jpg', '心清净故世界清净。心杂秽故世界杂秽。我佛法中以心为主。一切诸法无不由心。', '《大乘本生心地观经》', 'admin');
INSERT INTO `info` VALUES ('35', '2013-10-19', '/images/demo/1382141274181.jpg', '能观心者，究竟解脱：不能观心者，沉沦诸趣。', '《大乘本生心地观经》', 'admin');
INSERT INTO `info` VALUES ('36', '2013-10-20', '/images/demo/1382334459408.jpg', '如天雨滴。后不及前。虽不相及。能满大器。修学智慧。亦复如是。从小微起。终成大器。', '《末曾有经》', 'admin');
INSERT INTO `info` VALUES ('37', '2013-10-21', '/images/demo/1382334727366.jpg', '恶事向自己。好事与他人。若自扬己德。隐他人好事。令他受毁者。是菩萨波罗夷罪。', '《梵网经》', 'admin');
INSERT INTO `info` VALUES ('38', '2013-10-22', '/images/demo/1382409139116.jpg', '散心者尚不能得世间经书工巧等利。何况能得出世间利。故知一切世出世间利。皆以定心故得。', '《成实论》', 'admin');
INSERT INTO `info` VALUES ('39', '2013-10-23', '/images/demo/1382496346357.jpg', '若有能平等。观察一切法。如是等人辈。是则名智者。', '《佛说诸法勇王经》', 'admin');
INSERT INTO `info` VALUES ('40', '2013-10-24', '/images/demo/1382669202219.jpg', '纵此心者。丧人善事。制之一处。无事不办。', '《佛遗教经》', 'admin');
INSERT INTO `info` VALUES ('41', '2013-10-25', '/images/demo/1382669787703.jpg', '诸善男子。各谛思维。应当痛念生死事大。无常迅速。一失人身。万劫难复。况日月如流。时不可待。倘负此缘。当面错过。大限临头。悔之何及。', '《净宗法要》', 'admin');
INSERT INTO `info` VALUES ('42', '2013-10-26', '/images/demo/1382783718212.jpg', '不究自心。但知外务。或求利养。或好名闻。或贪现世欲乐。或望未来果报。如是发心。名之为邪。', '《劝发菩提心文》', 'admin');
INSERT INTO `info` VALUES ('43', '2013-10-27', '/images/demo/1382946908668.jpg', '追求诸欲诸有情类。于诸欲中。受追求所作苦。受防护所作苦。受亲爱失坏所作苦。受无厌足所作苦。受不自在所作苦。受恶行所作苦。', '《瑜伽师地论》', 'admin');
INSERT INTO `info` VALUES ('44', '2013-10-28', '/images/demo/1382947259342.jpg', '心中众生。所谓邪迷心。诳妄心。不善心。嫉妒心。恶毒心。如是等心。尽是众生。各须自性自度。是名真度。', '《六祖坛经》', 'admin');
INSERT INTO `info` VALUES ('45', '2013-10-29', '/images/demo/1383135799268.jpg', '人不持戒。兹蔓如藤。逞情极欲。恶行日增。', '《法句经》', 'admin');
INSERT INTO `info` VALUES ('46', '2013-10-30', '/images/demo/1383135825532.jpg', '知足之人。虽卧地上。犹为安乐。不知足者。虽处天堂。亦不称意。不知足者。虽富而贫。知足之人。虽贫而富。', '《佛遗教经》', 'admin');
INSERT INTO `info` VALUES ('47', '2013-10-31', '/images/demo/1383135857436.jpg', '莫轻小善。以为无福。水渧虽微。渐盈大器。凡福充满。从纤纤积。', '《出曜经》', 'admin');
INSERT INTO `info` VALUES ('48', '2013-11-01', '/images/demo/1383222959511.jpg', '不随于心。能为心师。以心师故。则能得为。一切法师。若能于心得自在者。则于诸法。而得自在。', '《大乘宝云经》', 'admin');
INSERT INTO `info` VALUES ('49', '2013-11-02', '/images/demo/1383748188380.jpg', '谁能知死时。所趣从何道。譬如风中灯。不知灭时节。', '《坐禅三昧经》', 'admin');
INSERT INTO `info` VALUES ('50', '2013-11-03', '/images/demo/1383748230848.jpg', '若人不能一心观察生死过咎。涅槃安乐。如是之人虽复惠施持戒多闻。终不能得解脱分法。', '《优婆塞戒经》', 'admin');
INSERT INTO `info` VALUES ('51', '2013-11-04', '/images/demo/1383748270513.jpg', '我终不说一向弃背利益众生事者，一向弃背发起诸行所作者，当作道场，能得阿耨多罗三藐三菩提。', '《解深密经》', 'admin');
INSERT INTO `info` VALUES ('52', '2013-11-05', '/images/demo/1383748304472.jpg', '心净则土亦净。心秽则土亦秽。一念恶心起。刀林剑树枞然。一念善心生。宝地华池宛尔。由是观之。天堂地狱。又岂外于此心哉。', '《净宗法要》', 'admin');
INSERT INTO `info` VALUES ('53', '2013-11-06', '/images/demo/1383748342471.jpg', '佛祖出世，千言万语，种种方便，说禅说教，无非随顺机宜，破执之具，元无实法与人。', '《初心修悟法要》', 'admin');
INSERT INTO `info` VALUES ('54', '2013-11-08', '/images/demo/1383846298927.jpg', '譬如不下巨海。不能得无价宝珠。如是不入烦恼大海。则不能得一切智宝。', '《维摩经》', 'admin');
INSERT INTO `info` VALUES ('55', '2013-11-07', '/images/demo/1383846362586.jpg', '佛告迦叶。世间乐者。彼则是苦。于彼出离。如是业尽得解脱。', '《大法鼓经》', 'admin');
INSERT INTO `info` VALUES ('56', '2013-11-09', '/images/demo/1383911214747.jpg', '朋友之法。其要有三：一者见有过失。转相谏晓。二者见有好事。深生随喜。三者在于苦厄。不相弃舍。', '《大善权经》', 'admin');
INSERT INTO `info` VALUES ('57', '2013-11-10', '/images/demo/1383977186111.jpg', '过去之法不应追念。未来之法不应希求。现在之法不应住著。若能如是。当处解脱。', '《善夜经》', 'admin');
INSERT INTO `info` VALUES ('58', '2013-11-11', '/images/demo/1384073054905.jpg', '佛名经云。罪从心生。还从心灭。故知善恶一切。皆由自心。所以心为根本也。若求解脱者。先须识根本。若不达此理。虚费功劳。于外相求。无有是处。', '《顿悟入道要门论》', 'admin');
INSERT INTO `info` VALUES ('59', '2013-11-12', '/images/demo/1384184515832.jpg', '知幻即离。不作方便。离幻即觉。亦无渐次。一切菩萨及末世众生。依此修行。如是乃能永离诸幻。', '《圆觉经》', 'admin');
INSERT INTO `info` VALUES ('60', '2013-11-13', '/images/demo/1384424212255.jpg', '夫百千法门。同归方寸。河沙妙德。总在心源。一切戒门定门慧门。权实二法。神通变化悉自具足。不离汝心。', '《宗镜录》', 'admin');
INSERT INTO `info` VALUES ('61', '2013-11-14', '/images/demo/1384424249917.jpg', '可言不可行。不若勿言。可行不可言。不若勿行。发言必虑其所终。立行必稽其所蔽。', '《禅林宝训》', 'admin');
INSERT INTO `info` VALUES ('62', '2013-11-15', '/images/demo/1384424284164.jpg', '世间学问，义理浅，头绪多，故似易反难。出世学问，义理深，线索一，故虽难仍易。线索非他，现前一念心性而已。', '《灵峰宗论》', 'admin');
INSERT INTO `info` VALUES ('63', '2014-04-01', '/images/demo/1399245769607.jpg', '知多欲为苦。生死疲劳。从贪欲起。少欲无为。身心自在。', '《佛遗教三经》', 'galar');
INSERT INTO `info` VALUES ('64', '2014-04-02', '/images/demo/1399252234511.jpg', '人怀爱欲。不见道者。譬如澄水。致水搅之。众人共临。无有睹其影者。', '《佛说四十二章经》', 'galar');
INSERT INTO `info` VALUES ('65', '2014-04-03', '/images/demo/1399252298299.jpg', '学先断母。率君二臣。废诸营从。是上道人。', '《法句经》', 'galar');
INSERT INTO `info` VALUES ('66', '2014-04-04', '/images/demo/1399252332890.jpg', '两舌之罪。亦令众生堕三恶道。若生人中得二种果报。一者眷属乖离。二者亲族弊恶。', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('67', '2014-04-05', '/images/demo/1399252358613.jpg', '一切诸报。皆从业起。一切诸果。皆从因起。一切诸业。皆从习起。', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('68', '2014-04-06', '/images/demo/1399252398872.jpg', '复睡眠人喜睡眠有三因缘。一者多食。二者饮。三者忧。复有三因缘。一者身休息。二者余意极卧出更受意。三者留受故。', '《佛说骂意经》', 'galar01');
INSERT INTO `info` VALUES ('69', '2014-04-07', '/images/demo/1399252424295.jpg', '恰恰用心时，恰恰无心用，无心恰恰用，常用恰恰无。', '《奢摩他頌》', 'galar01');
INSERT INTO `info` VALUES ('70', '2014-04-08', '/images/demo/1399252451455.jpg', '天上天下，唯我独尊，自观自在，守本真心。', '《修心诀》', 'galar01');
INSERT INTO `info` VALUES ('71', '2014-04-09', '/images/demo/1398694345425.jpg', '夫学有二。常亲多闻。安谛解义。虽困不邪。', '《法句经》', 'galar01');
INSERT INTO `info` VALUES ('72', '2014-04-10', '/images/demo/1399252477759.jpg', '嫉妒疾浊故。则失于善心。恶见三毒缘。如是贪增长。', '《德护长者经》', 'galar01');
INSERT INTO `info` VALUES ('73', '2014-04-11', '/images/demo/1399252514169.jpg', '修戒布施。作福为福。从是适彼。常到安处。', '《法句经》', 'galar01');
INSERT INTO `info` VALUES ('74', '2014-04-12', '/images/demo/1399252529471.jpg', '人命不久住。犹如拍手声。人身不如法。愚痴空过世。', '《正法念处经》', 'galar01');
INSERT INTO `info` VALUES ('75', '2014-04-13', '/images/demo/1399252553855.jpg', '心无挂碍，无挂碍故，无有恐怖。\r\n\r\n\r\n', '《心经》', 'galar01');
INSERT INTO `info` VALUES ('76', '2014-04-14', '/images/demo/1399252576116.jpg', '凡所有相，皆是虚幻。', '《金刚经》', 'galar01');
INSERT INTO `info` VALUES ('77', '2014-04-15', '/images/demo/1399252645737.jpg', '色即是空，空即是色。', '《般若波罗密多心经》', 'galar01');
INSERT INTO `info` VALUES ('78', '2014-04-16', '/images/demo/1399252684576.jpg', '一花一世界，一佛一如来。', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('79', '2014-04-17', '/images/demo/1398736791428.jpg', '众生相尅。以丧其命。随行所堕。自受殃福。', '《法句经》', 'galar01');
INSERT INTO `info` VALUES ('80', '2014-04-18', '/images/demo/1398775322648.jpg', '诸法因缘生,我说是因缘；因缘尽故灭，我作如是说 。', '《造塔功德经》', 'galar01');
INSERT INTO `info` VALUES ('81', '2014-04-19', '/images/demo/1398775837673.jpg', '此有故彼有，此生故彼生；此无故彼无，此灭故彼灭。', '《杂阿含经》', 'galar01');
INSERT INTO `info` VALUES ('82', '2014-04-20', '/images/demo/1399252739600.jpg', '一切行无常，生者必有尽，不生则不死，此灭最为乐。', '《增一阿含经》', 'galar01');
INSERT INTO `info` VALUES ('83', '2014-04-21', '/images/demo/1399252763905.jpg', '一切有为法。如梦幻泡影。 如露亦如电。应作如是观', '《金刚经》 ', 'galar01');
INSERT INTO `info` VALUES ('84', '2014-04-22', '/images/demo/1399252790861.jpg', '觉悟世间无常。国土危脆。四大苦空。五阴无我。生灭变异。虚伪无主。心是恶源。形为罪薮。如是观察。渐离生死。 ', '《佛说八大人觉经》', 'galar01');
INSERT INTO `info` VALUES ('85', '2014-04-23', '/images/demo/1398779949246.jpg', '佛告阿难。汝常闻我毗奈耶中，宣说修行三决定义。所谓摄心为戒。因戒生定。因定发慧。是则名为三无漏学。', '《楞严经》', 'galar01');
INSERT INTO `info` VALUES ('86', '2014-04-24', '/images/demo/1398780690573.jpg', '我本因地，以念佛心，入无生忍，今于此界，摄念佛人，归于净土。佛问圆通，我无选择，都摄六根，净念相继，得三摩地，斯为第一。', '《楞严经》', 'galar01');
INSERT INTO `info` VALUES ('87', '2014-04-25', '/images/demo/1399252839805.jpg', '当舍于懈怠，远离诸愦闹；寂静常知足，是人当解脱。', '《大宝积经第91卷》', 'galar01');
INSERT INTO `info` VALUES ('88', '2014-04-26', '/images/demo/1399252861448.jpg', '作是观者。名为正观。若他观者。名为邪观。', '《观无量寿经》', 'galar01');
INSERT INTO `info` VALUES ('89', '2014-04-27', '/images/demo/1399252889399.jpg', '我观是南阎浮提众生，举心动念无不是罪。', '《地藏经》', 'galar01');
INSERT INTO `info` VALUES ('90', '2014-04-28', '/images/demo/1399252967174.jpg', '知幻即离，不假方便；离幻即觉，亦无渐次。', '《圆觉经》', 'galar01');
INSERT INTO `info` VALUES ('91', '2014-04-29', '/images/demo/1399253005906.jpg', '若人欲了知，三世一切佛。应观法界性，一切唯心造。', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('92', '2014-04-30', '/images/demo/1399253029709.jpg', '人在世间，爱欲之中，独生独死，独去独来。当行至趣，苦乐之地，身自当之，无有代者。', '《无量寿经》', 'galar01');
INSERT INTO `info` VALUES ('93', '2014-05-01', '/images/demo/1398858513275.jpg', '佛言，爱欲莫甚于色。色之为欲，其大无外，赖有一矣，若使二同，普天之人，无能为道者矣。', '《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('94', '2014-05-02', '/images/demo/1398858918762.jpg', '佛言：当念身中四大，各自有名，都无我者，我既都无。其如幻耳。', '--《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('95', '2014-05-03', '/images/demo/1398859325398.jpg', '心有所住，即为非住。应无所住而生其心。', '《金刚经》', 'galar01');
INSERT INTO `info` VALUES ('96', '2014-05-04', '/images/demo/1398859959987.jpg', '知见立知，即无明本。', '《楞严经》', 'galar01');
INSERT INTO `info` VALUES ('97', '2014-05-05', '/images/demo/1398861998284.jpg', '诸恶莫作,众善奉行,自净其意,是诸佛教.', '《增一阿含经》', 'galar01');
INSERT INTO `info` VALUES ('98', '2014-05-06', '/images/demo/1398866966415.jpg', '恶人害贤者，犹仰天而唾，唾不至天，还从己堕。逆风扬尘，尘不至彼，还坌己身。贤不可毁，祸必灭己。', '《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('99', '2014-05-07', '/images/demo/1398953593810.jpg', '沙门行道,无如磨牛,身虽行道,心道不行.心道若行,何用行道.', '《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('100', '2014-05-08', '/images/demo/1398953995794.jpg', '是日已过,命亦随减.如少水鱼,斯有何乐.', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('101', '2014-05-09', '/images/demo/1398954342691.jpg', '夫为道者，如牛负重，行深泥中，疲极不敢左右顾视。出离淤泥，乃可苏息。沙门当观情欲，甚于淤泥。直心念道，可免苦矣。', '《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('102', '2014-05-10', '/images/demo/1398954474677.jpg', '夫为道者，如被干草，火来须避。道人见欲，必当远之。', '《佛说四十二章经》', 'galar01');
INSERT INTO `info` VALUES ('103', '2014-05-11', '/images/demo/1398954815922.jpg', '一切惜身命，人畜等无殊。若欲食众生，先试割身肉。    死是极大苦，谁能不畏之。但当自观身，云何食他肉。    为利杀众生，以财网诸肉。二俱得杀业，死堕叫唤狱。', '《念佛镜》', 'galar01');
INSERT INTO `info` VALUES ('104', '2014-05-12', '/images/demo/1398955150545.jpg', '若人知心行，普造诸世间。是人则见佛，了佛真实性。', '《地藏菩萨本愿经》', 'galar01');
INSERT INTO `info` VALUES ('105', '2014-05-13', '/images/demo/1398955292365.jpg', '多欲为苦,生死疲劳,从贪欲起,少欲无为,身心自在。', '《八大人觉经》', 'galar01');
INSERT INTO `info` VALUES ('106', '2014-05-14', '/images/demo/1398955562872.jpg', '舍利子．色不异空．空不异色．色即是空．空即是色．受想行识．亦复如是．舍利子．是诸法空相．不生不灭．不垢不净．不增不减．', '《般若波罗蜜多心经》', 'galar01');
INSERT INTO `info` VALUES ('107', '2014-05-15', '/images/demo/1398956067675.jpg', '观身不净,观受是苦,观心无常,观法无我.', '《佛说十善业道经》', 'galar01');
INSERT INTO `info` VALUES ('108', '2014-05-16', '/images/demo/1399115730718.jpg', '诸心皆为非心，是名为心。', '《金刚经》', 'galar01');
INSERT INTO `info` VALUES ('109', '2014-05-17', '/images/demo/1399116514810.jpg', '超越声闻缘觉之地，得空无相无愿三昧。', '《无量寿经》', 'galar01');
INSERT INTO `info` VALUES ('110', '2014-05-18', '/images/demo/1399116842979.jpg', '一切自在难思议，华严三昧势力故。', '《华严经》', 'galar01');
INSERT INTO `info` VALUES ('111', '2014-05-19', '/images/demo/1399117500728.jpg', '如河驶流。往而不返。人命如是。逝者不还。', '《法句经》', 'galar01');
INSERT INTO `info` VALUES ('112', '2014-05-20', '/images/demo/1399117978518.jpg', '舌如彼炽火。心则如其薪。恶言如猛焰。焚烧诸众生。', '《诸法集要经》', 'galar01');
