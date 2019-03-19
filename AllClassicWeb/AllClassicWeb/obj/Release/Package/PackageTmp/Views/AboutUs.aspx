<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="AllClassicWeb.Views.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div class="row">
        <div class=" col-xs-2">
            <ul class="nav nav-pills nav-stacked Contentdisplay" style="background-color: #f7f7f7; color:black;">
                <li class="active"><a data-toggle="tab" href="#menu1" style="text-decoration:none;"><%= Resources.DisplayText.CompanyBackground %></a></li>
                <li><a data-toggle="tab" href="#menu4" style="text-decoration:none;"><%= Resources.DisplayText.CEOMessage %></a></li>
                <li><a data-toggle="tab" href="#menu2" style="text-decoration:none;"><%= Resources.DisplayText.BODMembers %></a></li>
                <li><a data-toggle="tab" href="#menu3" style="text-decoration:none;"><%= Resources.DisplayText.Advisorymembers %></a></li>
                <li><a data-toggle="tab" href="#menu5" style="text-decoration:none;"><%= Resources.DisplayText.CompLocation %></a></li>
            </ul>
        </div>
        <div class=" col-xs-10">
            <div class="tab-content">

                <div id="menu1" class="tab-pane fade in active">
                    <div class="row">
                        <h4 class="contentHeader" style="font-weight: 700"><%= Resources.DisplayText.CompanyBackground %></h4>
                        <div class="Contentdisplay col-xs-12">

                            <p><strong>설립 배경</strong><strong>:</strong></p>
                            <ul>
                                <li>IT 강국 대한민국에 클래식 음악 관련 자료를 한 눈에 검색해 볼 수 있는 싸이트가 없어, 각 공연 공연기록이나 뮤지션/오케스트라의 프로필 및 레파토리를 조회를 할 수 있는 방법이 없음을 아쉬워하는 사람들이 자발적으로 뜻과 자금을 모아, 클래식 음악계 및 공연 제반 자료를 포탈로 구축하고, 기록관에 아카이빙으로 저장하여 사후 관리하는 시스템을 만들고자 함.</li>
                            </ul>
                            <p>&nbsp;</p>
                            <p><strong>운영 방침</strong><strong>:</strong></p>
                            <ul>
                                <li>본 시스템은 클래식 음악계에 활동하는 분들을 위한 것임과 동시에 구성원의 자발적 참여 없이 구축이 어려움.</li>
                                <li>공연 기획사나 주관사는 무상으로 제반 공연을 홍보할 수 있도록 함.</li>
                                <li>보다 많은 분들의 참여를 위해 비영리 사회적 기업으로 운영하고 매년 사업의 결과를 투명하게 공개함.</li>
                                <li>본 취지를 공감하시는 분들에겐 누구든 사업의 주체로 참여할 수 있도록 주식취득을 공개함 과 아울러 재능 기부와 자원봉사의 영역이 마련됨.</li>
                                <li>본 사업을 운영 재원 조달을 위한 BlockChain기반의 Digital Asset 유통 시스템(Classic Coin 발행)을 운영함.</li>
                            </ul>


                        </div>
                    </div>

                </div>

                <div id="menu2" class="tab-pane fade">
                    <div class="row">
                        <h4 class="contentHeader" style="font-weight: 700">BOD and Advisor Introduction</h4>
                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">
                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/JEON%20DONGSU.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">전동수 (JEON DONGSU)/대표이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">
                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>문화예술 월간지 아츠앤컬쳐 발행인</li>
                                        <li>서울그랜드필하모닉오케스트라 예술총감독</li>
                                        <li>ChorusNAU 예술감독 겸 지휘자, 음악평론가</li>
                                    </ul>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>한수원아트페스티벌 예술총감독 역임</li>
                                        <li>대한적십자사 미래전략특별위원 역임</li>
                                        <li>예술의전당 비전위원 역임</li>
                                        <li>뉴서울필하모닉오케스트라 예술총감독 역임</li>
                                        <li>비씨다르테 국제콩쿨 심사위원 역임</li>
                                        <li>벨리니 국제콩쿨 심사위원 역임</li>
                                        <li>서울대학교 음악대햑/이탈리아 국립로시니음익원 졸업</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/백대원.png" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">백대원/기획개발 담당 이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>클래식 마니아, ChorusNAU 합창단원</li>
                                        <li>AI와 BlockChain 산업에서 고군분투 중. 주중 저녁엔 라틴댄스, 주말에 농부로 변신.</li>
                                        <li>미국 보스톤에서 2개의 Startup 설립과 exit 경험 있음.</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>현 :㈜세미콘네트웍스 대표이사</li>
                                        <li>전: VoiceSignal/AMD/Motorola</li>
                                        <li>진주고등학교/중앙대학교 졸</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/이옥정.png" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">이옥정/운영이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>Cello 연주자</li>
                                        <li>오케스트라, 실내악 연주를 하며 공연이 무사히 이루어 지기까지 많은 일들을 함께 하고 있습니다.</li>
                                        <li>음악인에게 도움이 되는 일에 적극 참여합니다.</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>현: 서울이무지치 챔버 단원</li>
                                        <li>전: 송파구립교향악단, 서울 오케스트라 단원 역임</li>
                                        <li>성신여자 대학교/성신여자대학교 대학원 기악과 졸</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/오종혁.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">오종혁/회계담당 이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>공인회계사</li>
                                        <li>클래식에 관심을 가지려 참여함.</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>세영세무회계 대표 회계사</li>
                                        <li>전 도원회계법인 근무</li>
                                        <li>국민대학교 정치외교학 학사</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/Eva%20Yang.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">Eva Yang/마케팅 이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>Arts &amp; Culture의 힘을 믿으며 Homo Ludens를 지향함</li>
                                        <li>자급자족의 인생과 소소하게 함께하며 나누는 삶을 소망함</li>
                                        <li>타샤 할머니처럼 사는게 꿈</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>㈜ 큐제네틱스 이사</li>
                                        <li>SCA 대표이사</li>
                                        <li>공주사대부고, 한국외대 졸업</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/소개.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">서훈/마케팅 이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>프랑스 Rueil Malmaison 국립음악원 지휘과 졸업</li>
                                        <li>프랑스 Reims 국립음악원 지휘과 졸업</li>
                                        <li>오스트리아 Wien Master Classe Diplome</li>
                                        <li>프랑스 Ecole Normale de Musique de Paris 지휘과 수료</li>
                                        <li>Yehudi Menuhin주최 유럽지휘자 Festival에서</li>
                                        <li>불가리아 소피아 아카데미 오케스트라 지휘</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>러시아 하바로프스크 심포니 오케스트라 객원지휘</li>
                                        <li>일본, 대만, 러시아, 영국, 이태리 등 해외 초청 연주 지휘</li>
                                        <li>서울시향, 제주시향, 목포시향, 춘천시향, 충남도립, 고려교향악단,</li>
                                        <li>뉴 서울 필하모닉, 프라임 필하모닉 오케스트라 등 국내 교향악단 객원지휘</li>
                                        <li>부천시립 교향악단 초대 상임지휘자 역임</li>
                                        <li>현 서울그랜드필하모닉오케스트라 음악감독 겸 상임지휘자</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/CHUNG%20YEONSIL.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">정연실 (CHUNG YEONSIL)/ 감사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>감정이 담긴 자연스러운 노래를 좋아하는 소프라노</li>
                                        <li>클래식을 사랑하며 특히 푸치니의 오페라와 슈트라우스, 브람스 음악을 좋아함</li>
                                        <li>예술기획에도 관심이 많음</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>상명대학교 음악대학, 음악교육대학원 졸업</li>
                                        <li>이탈리아 베르디 국립음악원 졸업</li>
                                    </ul>

                                </div>

                            </div>
                        </div>


                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/조재위.png" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">조재위/홍보 담당 이사</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>클래식 매니아</li>
                                        <li>전 ㈜일화 경남 지점장/㈜솔루에타 대표이사</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">

                                        <li>아시아 비즈니스 동맹(ABA) 활동 중</li>
                                        <li>대아고등학교/경상대학교 졸</li>

                                    </ul>

                                </div>

                            </div>
                        </div>

                    </div>


                </div>

                <div id="menu3" class="tab-pane fade">

                    <div class="row">

                        <h4 class="contentHeader" style="font-weight: 700">자문 위원(Advisory Group)</h4>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/이해영.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">이해영/아카이빙 자문위원</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>기록정보서비스와 기록의 분류기술 등의 과목을 가르치고 있음.&nbsp;</li>
                                        <li>이용자들에게 좋은 서비스를 제공하는 방법과 관련된 연구들 진행.&nbsp;</li>
                                        <li>기록서비스에 IT와 인공지능의 활용 방법 등에 관심을 갖고 공부 중.&nbsp;</li>
                                        <li>클래식 초보 애호가.</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>명지대학교 기록정보과학전문대학원 교수, 국회기록관리위원회 위원.</li>
                                        <li>전 한국기록관리학회장, 국가기록관리위원, 대통령기록관리전문위원, 명지대학교 사회교육대학원장.</li>
                                        <li>미국 Simmons University 문헌정보학 이학석사, 문학박사</li>
                                        <li>이화여자대학교 시청각교육과 학사, 교육대학원 사서교육학 석사</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/옥영천.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">옥영천/법인운영 자문위원</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>음악 (감상, 오디오) 과 예술을 사랑하는 사람</li>
                                        <li>ChorusNAU 합창단원</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>문화예술 월간지 아츠앤컬쳐 고문</li>
                                        <li>경기지방노동위원회 사용자위원</li>
                                        <li>수원여자대학교 학생처장</li>
                                        <li>전 씨티은행 씨티골드영업부장/산업은행 KDBdirect 운영팀장</li>
                                        <li>부산대학교 법과대학 졸업</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/최승희.png" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">최승희/법률 자문위원</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>서초동에 나만의 법률사무소 둥지를 틀었음. 예술의 전당이 근처에 있어서 좋음.</li>
                                        <li>고시 준비할 때 백색소음기 기능으로 클래식을 항상 틀어 놓았던 것이 클래식과 친해지는 계기가 됨.</li>
                                        <li>블록체인/핀테크에 대한 호기심을 실천에 옮기는 중.</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>두림법률사무소 대표변호사</li>
                                        <li>사법연수원 44기</li>
                                        <li>동국대학교 법학과 학사</li>
                                        <li>동국대학교 핀테크/블록체인 융합산업 제8기 최고위 과정 수료</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 BodmembersContainer">
                            <div class="thumbnail " style="border: none">

                                <div class="col-xs-3">
                                    <img src="../Doc/BOD/김인택.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px;">
                                    <h5 class="BodmembersNameContainer contentHeader">김인택/엔지니어링 자문위원</h5>
                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>소개</strong></p>
                                    <ul class="sogea_textcolor">
                                        <li>인공지능/기계학습 전문가</li>
                                        <li>클래식 애호가</li>
                                    </ul>

                                </div>
                                <div class="col-xs-4 Contentdisplay">

                                    <br />
                                    <p><strong>약력</strong></p>
                                    <ul class="sogea_textcolor2">
                                        <li>명지대학교 정보통신공학과 교수</li>
                                        <li>전 LG 종합기술원</li>
                                        <li>서울대학교, 조지아공대 졸업</li>
                                    </ul>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>

                <div id="menu4" class="tab-pane fade">
                    <div class="col-xs-12" style="margin-left: auto; margin-right: auto;">
                        <img src="../Doc/BOD/JEON%20DONGSU.jpg" class="img-circle" alt="Cinque Terre" style="width: 200px; height: 200px; display: block; margin-left: auto; margin-right: auto;">
                        <h5 class="BodmembersNameContainer contentHeader">전동수 (JEON DONGSU)/대표이사</h5>
                    </div>
                    <div class="col-xs-12 Contentdisplay">
                        <p>앞으로 가장 주목을 받는 분야는 바이오, 엔터테인먼트, 인공지능을 바탕으로 한 산업이라고 말을 합니다. 그중 순수한 클래식 음악을 포함한 모든 예술과 관련된 엔터테인먼트 분야는 인간에게 창의력을 갖게 해주는 아주 중요한 산업이라고 생각합니다.</p>
                        <p>&nbsp;</p>
                        <p>올클래식코리아는 클래식 음악의 발전을 도모하기 위해 공연 기록물 정보를 구축하고 디지털화해서 대중에게 제공함으로써 그 가치를 실현하고 삶의 품격을 높이기 위해 설립되었습니다.</p>
                        <p>&nbsp;</p>
                        <p>올클래식코리아는 국내 최고의 클래식 공연 기록관을 만들어 문화교류 포탈을 구축함으로써 대한민국의 국격을 높이고 우리 공동체의 문화환경 발전과 정보 공유에 따른 관련 산업의 균형발전 실현에 공헌하고자 합니다.</p>
                        <p>&nbsp;</p>
                        <p>"예술의 목적은 일상 속에 찌든 영혼을 정화하기 위함"이라고 파블로 피카소는 말했습니다.</p>
                        <p>&nbsp;</p>
                        <p>올클래식코리아는 신뢰와 정직, 열린 마음과 열정을 가지고 클래식 음악 발전을 도모하고 우리 영혼의 정화를 위해 노력하겠습니다.</p>
                        <p>&nbsp;</p>
                        <p>감사합니다.</p>
                        <p>&nbsp;</p>
                        <p>대표이사 전동수</p>
                    </div>
                </div>

                <div id="menu5" class="tab-pane fade">
                    <div class="col-xs-12">
                    <img src="../Content/img/location.jpg" style="width:100%; margin-bottom:20px;"/>
                    <p>
                        주소: 서울시 강남구 역삼동 220 홍성빌딩 3층 (우)06227
                        <br />
                        ㈜올클래식코리아
                        <br />
                        전화: 02)561-7080 팩스: 02)561-6082 
                        <br />
                        담당: 백대원/daewonbaek@gmail.com 
                        <br />
                    </p>
                        </div>
                </div>
            </div>
        </div>
    </div>


    <style>
        .paragrphContainer {
            box-sizing: border-box;
            color: rgb(33, 37, 41);
            font-family: Lora, "Times New Roman", serif;
            font-size: 20px;
            font-weight: 400;
            line-height: 30px;
            margin-bottom: 30px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 30px;
            text-align: left;
        }
    </style>


    <script type="text/javascript">
       // document.getElementById("introductiontab").style.backgroundColor = "white";
       // document.getElementById("introductiontab").style.borderBottom = "none";
    </script>

</asp:Content>
