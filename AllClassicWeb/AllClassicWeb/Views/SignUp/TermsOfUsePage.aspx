<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsOfUsePage.aspx.cs" Inherits="AllClassicWeb.Views.SignUp.TermsOfUsePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <br />
            <h4><%= Resources.DisplayText.SignUp %></h4>
            <hr />
            <div class="row">
                <%--<div class="col-md-2 col-xs-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action active"><%= Resources.DisplayText.AcceptTerms %></a>
                        <a class="list-group-item list-group-item-action" onclick="showSelectMessage()"><%= Resources.DisplayText.UserInfo %></a>
                    </ul>
                </div>--%>
                <div class="  col-xs-12 ">

                    <h6 class="contentHeader"><%= Resources.DisplayText.Termsofuse %></h6>
                    <div style="background-color: white; height: 500px; overflow-y: scroll;"
                        class="shadowedPanel filedDisplay">

                        <p>제1조 (목적)</p>
                        <p>이 약관은 (주)올클래식코리아(이하 &ldquo;올클래식&rdquo;이라고 합니다.)가 운영하는 (주)올클래식코리아의 회원(이하 &ldquo;회원&rdquo;이라고 합니다.) 가입과 혜택 등(이하 &ldquo;서비스&rdquo;라고 합니다) 이용조건 및 절차에 관하여 (주)올클래식코리아와 회원 사이의 권리, 의무 및 책임사항의 규정을 목적으로 합니다.</p>
                        <p>제2조 (약관의 명시 및 개정)</p>
                        <ol>
                            <li>본 약관은 &ldquo;올클래식&rdquo;이 인터넷 홈페이지 화면 또는 지면에 게시하거나 기타의 방법으로 회원에게 공지하고 &ldquo;회원&rdquo;이 동의함으로써 효력이 발생합니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 필요에 따라 본 약관을 개정할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력이 발생합니다.</li>
                            <li>변경된 약관의 효력 발생일 이후의 계속적인 서비스 이용은 변경 약관에 동의한 것으로 간주됩니다.</li>
                        </ol>
                        <p>제3조 (약관 외 준칙) 본 약관에 명시되지 않은 사항과 본 약관에 대한 해석은 정부가 제정한 법령과 지침, 기준 등 관계 법령 또는 상관례에 따릅니다.</p>
                        <p>제4조 (용어의 정의)</p>
                        <ol>
                            <li>&ldquo;등록&rdquo;이라 함은 고객이 &ldquo;올클래식&rdquo;의 &ldquo;서비스&rdquo;를 받고자 &ldquo;올클래식&rdquo;에 최초로 개인정보를 제공하고 본 약관에 동의하는 절차를 뜻합니다.</li>
                            <li>&ldquo;탈퇴&rdquo;이라 함은 &ldquo;회원&rdquo;이 &ldquo;올클래식&rdquo;에 등록된 &ldquo;개인정보&rdquo;의 제공을 철회하고 더 이상 &ldquo;서비스&rdquo;를 받는 것을 중단하는 행위를 뜻합니다.</li>
                            <li>&ldquo;회원등급&rdquo;이라 함은 &ldquo;올클래식&rdquo;이 &ldquo;서비스&rdquo; 중 특화된 서비스를 제공하기 위하여 별도의 &ldquo;회원&rdquo;의 동의를 받거나 자동적으로 &ldquo;가입&rdquo;되는 회원의 서비스 구분을 뜻합니다.</li>
                            <li>&ldquo;가입&rdquo;이라 함은 &ldquo;등록&rdquo;된 &ldquo;회원&rdquo;이 특화된 &ldquo;서비스&rdquo;를 받기 위하여 특정 &ldquo;회원등급&rdquo;(예:골드회원, 블루회원)을 신청하는 행위를 뜻합니다. 이 때, &ldquo;올클래식&rdquo;은 &ldquo;회원등급&rdquo;에 따라 서비스 비용을 청구할 수 있습니다.</li>
                            <li>&ldquo;해지&rdquo;이라 함은 &ldquo;등록&rdquo;된 &ldquo;회원&rdquo;이 &ldquo;가입&rdquo;한 &ldquo;회원등급&rdquo;의 &ldquo;서비스&rdquo;를 철회하는 행위를 뜻합니다.</li>
                            <li>&ldquo;만료&rdquo;라 함은 &ldquo;회원&rdquo;이 &ldquo;가입&rdquo;한 &ldquo;회원등급&rdquo;의 유효일이 지나 더 이상 &ldquo;서비스&rdquo;를 받을 수 없는 것을 뜻합니다.</li>
                            <li>&ldquo;개인정보 삭제&rdquo;라 함은 &ldquo;회원&rdquo;의 요구 또는 &ldquo;올클래식&rdquo;이 법령과 기준에 따라 개인정보를 삭제하는 행위로서, &ldquo;탈퇴&rdquo;와 같은 효력이 발생됩니다.</li>
                            <li>&ldquo;홈페이지&rdquo;라 함은 입장권 판매 및 수강신청을 위한 대표 홈페이지(http://www.sac.or.kr)를 뜻합니다.</li>
                            <li>&ldquo;유료회원&rdquo;이라 함은 &ldquo;올클래식&rdquo;의 &ldquo;회원등급&rdquo; 중 골드회원과 블루회원, 그린회원을 뜻합니다.</li>
                            <li>&ldquo;무료회원&rdquo;이라 함은 &ldquo;올클래식&rdquo;의 &ldquo;회원등급&rdquo; 중 가입비가 없는 싹틔우미회원, 노블회원, 일반회원을 뜻합니다.</li>
                            <li>&ldquo;일반회원&rdquo;이라함은 &ldquo;올클래식&rdquo; &ldquo;회원&rdquo; 등록시 기본적으로 가입되는 기본 &ldquo;회원등급&rdquo;을 뜻합니다.</li>
                        </ol>
                        <p>제5조 (등록신청 및 이용계약의 성립)</p>
                        <ol>
                            <li>&ldquo;서비스&rdquo; 이용을 원하는 고객은 &ldquo;올클래식&rdquo;이 지정한 소정양식의 가입신청서를 작성하여 온라인 또는 기타 올클래식이 지정하는 방법으로 요구하는 사항을 기록하여 &ldquo;등록&rdquo;을 신청합니다.</li>
                            <li>&ldquo;등록&rdquo;에 따른 &ldquo;서비스&rdquo; 이용계약은 고객의 약관 동의, 등록신청, &ldquo;올클래식&rdquo;의 승인에 의하여 성립됩니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 다음 각 호에 해당하는 경우에 한하여 &ldquo;등록&rdquo;을 거부할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>본인의 실명으로 신청하지 않은 경우</li>
                                    <li>사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청하는 경우</li>
                                    <li>기타 올클래식이 정한 &ldquo;등록&rdquo; 요건에 충족되지 않는 경우</li>
                                </ol>
                            </li>
                            <li>&ldquo;올클래식&rdquo;은 &ldquo;등록&rdquo; 신청이 다음 각 호에 해당하는 경우에는 그 신청에 대한 승낙 제한 사유가 해소될 때까지 승낙하지 않을 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>서비스 관련 설비의 여유가 없는 경우</li>
                                    <li>기술상의 장애 사유가 있는 경우</li>
                                    <li>기타 &ldquo;올클래식&rdquo;의 &ldquo;등록&rdquo; 승낙이 곤란한 경우</li>
                                </ol>
                            </li>
                            <li>&ldquo;올클래식&rdquo;은 정상적인 서비스 제공과 고객 중복 방지를 위하여 다음 각 호의 인증수단으로 고객에게 실명인증을 요구할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>아이핀 인증</li>
                                    <li>휴대폰 보유 인증</li>
                                </ol>
                            </li>
                        </ol>
                        <p>제6조 (회원의 기본회원등급 가입)</p>
                        <ol>
                            <li>고객은 &ldquo;올클래식&rdquo;의 &ldquo;회원&rdquo;으로 &ldquo;등록&rdquo;하는 경우 기본적으로 무료 &ldquo;일반회원&rdquo; &ldquo;회원등급&rdquo;의 자격을 부여받습니다. 단, 다음 각호의 경우에는 무료회원 자격을 유지하지 않습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>&ldquo;회원&rdquo;이 별도 &ldquo;탈퇴&rdquo;할 경우</li>
                                    <li>개인정보처리방침에 따라 서비스를 이용하지 않아 주기적으로 개인정보를 삭제하는 경우</li>
                                    <li>&ldquo;올클래식&rdquo;이 &ldquo;서비스&rdquo;를 중단하는 경우</li>
                                </ol>
                            </li>
                            <li>고객의 &ldquo;회원&rdquo;가입 계약은 &ldquo;올클래식&rdquo;의 승낙이 고객에게 도달한 시점으로 합니다.</li>
                        </ol>
                        <p>제7조 (만14세미만의 회원 등록 및 가입)</p>
                        <ol>
                            <li>&ldquo;올클래식&rdquo;은 만14세미만이 &ldquo;회원&rdquo; &ldquo;등록&rdquo; 및 &ldquo;가입&rdquo;을 할 경우 법정대리인의 동의를 얻어야 하며, 법정대리인의 동의를 받지 못한 만14세미만이 &ldquo;회원&rdquo; &ldquo;등록&rdquo; 및 &ldquo;가입&rdquo;을 거절할 수 있습니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 법정대리인의 동의를 받지 못한 &ldquo;유료회원&rdquo;의 &ldquo;가입&rdquo;에 대해 법정대리인의 철회 요구 시 본 약관의 환불 규정에 따라 환불합니다.</li>
                        </ol>
                        <p>제8조 (회원탈퇴 및 자격상실)</p>
                        <ol>
                            <li>&ldquo;회원&rdquo;은 언제든지 &ldquo;탈퇴&rdquo;를 요청할 수 있으며, &ldquo;올클래식&rdquo;은 다음 각 호의 사유를 제외하고 즉시 &ldquo;탈퇴&rdquo;를 처리합니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>법령에 따라 &ldquo;회원&rdquo;의 &ldquo;탈퇴&rdquo;를 특별히 거절해야 하는 사유가 있을 경우</li>
                                    <li>특정 &ldquo;회원등급&rdquo;의 연회비. 특정 &ldquo;회원등급&rdquo;의 &ldquo;서비스&rdquo;를 계속 받고자 하는 경우 &ldquo;회원&rdquo;은 &ldquo;탈퇴&rdquo;할 수 없으며, &ldquo;회원&rdquo;이 &ldquo;서비스&rdquo;의 중단을 요구할 경우, &ldquo;올클래식&rdquo;은 연회비를 환불규정에 따라 처리한 뒤 &ldquo;탈퇴&rdquo;처리합니다.</li>
                                    <li>아카데미 수강 또는 입장권 구매 등의 &ldquo;서비스&rdquo;에 따라 대금 정산 또는 서비스에 대한 이용이 있을 경우. 제2호와 같이 &ldquo;서비스&rdquo;의 중단을 요구할 경우 &ldquo;올클래식&rdquo;은 &ldquo;서비스 이용요금&rdquo;을 각 환불규정에 따라 처리한 뒤 &ldquo;탈퇴&rdquo;처리하며, 해당 &ldquo;서비스&rdquo;의 이용을 지속적으로 요구할 경우 &ldquo;올클래식&rdquo;은 &ldquo;서비스&rdquo;가 종료될 때까지 &ldquo;탈퇴&rdquo;를 거절할 수 있습니다. 이 때, 고객은 &ldquo;서비스&rdquo; 종료 시점에 다시 &ldquo;탈퇴&rdquo; 의사를 표시하여야 합니다.</li>
                                    <li>&ldquo;회원&rdquo;이 &ldquo;탈퇴&rdquo;를 할 경우, &ldquo;올클래식&rdquo;은 개인정보를 즉시 삭제하며, 삭제한 경우 &ldquo;회원&rdquo;은 이에 대한 복구를 요구할 수 없습니다. 단, 개인정보 이외의 정보는 제31조 &ldquo;잊혀질 수 있는 권리&rdquo;에서 삭제여부를 정합니다.</li>
                                </ol>
                            </li>
                            <li>제2항에 따라 &ldquo;탈퇴&rdquo;하더라도 관계 법령에 따라 거래 정보를 보존해야 할 경우, 올클래식에서 제정한 개인정보처리방침에 따른 기간 동안 개인정보를 보존할 수 있습니다. 본 정보는 &ldquo;회원&rdquo;이 열람할 수 있으나, 정정 또는 삭제를 요구할 수 없습니다.</li>
                            <li>&ldquo;회원&rdquo;이 다음 각 호의 사유에 해당하는 경우 &ldquo;올클래식&rdquo;은 &ldquo;회원&rdquo; 자격을 제한 또는 정지시킬 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>&ldquo;등록&rdquo; 신청시 허위 내용을 등록한 경우</li>
                                    <li>다음과 같은 범죄 행위와 관련된 경우
                                        <ol>
                                            <li>다른 사람의 아이디와 비밀번호를 도용한 경우</li>
                                            <li>서비스 운영을 고의로 방해한 경우</li>
                                            <li>같은 이용자가 다른 아이디로 이중 &ldquo;등록&rdquo;한 경우</li>
                                            <li>공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우</li>
                                            <li>다른 사람의 명예를 손상시키거나 불이익을 주는 경우</li>
                                            <li>입장권 구매, 이벤트 및 각종 신청사항을 허위, 부정, 남용할</li>
                                        </ol>
                                    </li>
                                </ol>
                            </li>
                        </ol>
                        <p>제9조 (등록사항의 변경)</p>
                        <ol>
                            <li>&ldquo;회원&rdquo;은 이용신청시 기재한 사항이 변경되었을 경우 온라인으로 직접 수정하거나 &ldquo;올클래식&rdquo;에 알려 정정을 요구하여야 합니다.</li>
                            <li>제1항의 사유로 인해 발생되는 손해에 대해 &ldquo;올클래식&rdquo;은 책임지지 않습니다.</li>
                        </ol>
                        <p>제10조 (올클래식의 의무)</p>
                        <ol>
                            <li>&ldquo;올클래식&rdquo;은 본 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자 불만을 처리할 수 있는 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리 책임자등을 고객이 쉽게 알 수 있도록 &ldquo;올클래식&rdquo;의 초기 서비스화면에 게시합니다. 다만, 약관의 내용은 고객이 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 법령과 본 약관이 금지하거나 공공질서에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는 데 최선을 다합니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 &ldquo;회원&rdquo;이 제기하는 불편, 불만 사항에 대해 정당하다고 판단할 경우 정해진 기준에 따라 처리하여야 합니다.</li>
                        </ol>
                        <p>제11조 (회원의 의무)</p>
                        <ol>
                            <li>&ldquo;회원&rdquo;은 관계법령, 본 약관의 규정, 이용안내 등 &ldquo;올클래식&rdquo;이 통지하는 사항을 준수하여야 하며, 기타 &ldquo;올클래식&rdquo;의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
                            <li>&ldquo;회원&rdquo;이 &ldquo;올클래식&rdquo; &ldquo;서비스&rdquo; &ldquo;등록&rdquo; 절차를 완료하는 순간부터 &ldquo;회원&rdquo;은 입력한 정보의 비밀을 유지할 책임이 있으며, &ldquo;회원&rdquo;의 인터넷 아이디와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 &ldquo;회원&rdquo;에게 있습니다.</li>
                            <li>&ldquo;회원&rdquo;은 &ldquo;서비스&rdquo; 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>다른 &ldquo;회원&rdquo;의 아이디, 회원카드, 회원번호를 부정하게 사용하는 행위</li>
                                    <li>&ldquo;서비스&rdquo;에서 얻는 정보를 &ldquo;올클래식&rdquo;의 사전 승낙없이 &ldquo;회원&rdquo;의 이용 이외의 목적으로 복제하거 나, 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위</li>
                                    <li>&ldquo;올클래식&rdquo;의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</li>
                                    <li>정보통신설비의 오동작 및 정보 등의 파괴 혼란을 유발시키는 행위</li>
                                    <li>범죄와 결부된다고 객관적으로 판단되는 행위</li>
                                    <li>기타 관계법령이나 &ldquo;올클래식&rdquo;이 정한 이용조건에 위배되는 행위</li>
                                </ol>
                            </li>
                        </ol>
                        <p>제12조 (회원의 게시물)</p>
                        <ol>
                            <li>&ldquo;올클래식&rdquo;은 회원이 게시하거나 등록하는 서비스의 내용물이 다음 각 호에 해당된다고 판단할 경우, 사전 통지 없이 삭제할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>다른 &ldquo;회원&rdquo; 또는 제3자를 비방하거나 중상모략으로 명예를 손상시킬 우려가 있는 경우</li>
                                    <li>공공질서 및 미풍양속에 위반될 우려가 있는 경우</li>
                                    <li>범죄 행위에 결부된다고 인정되는 경우</li>
                                    <li>&ldquo;올클래식&rdquo;의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 경우</li>
                                    <li>&ldquo;올클래식&rdquo;에서 규정한 게시기간을 초과하는 경우</li>
                                    <li>&ldquo;회원&rdquo;이 &ldquo;올클래식&rdquo; 홈페이지 게시판에 음란물을 게재하거나 음란 사이트를 링크하는 경우</li>
                                    <li>기타 관계법령에 위반된다고 판단되는 경우</li>
                                </ol>
                            </li>
                            <li>&ldquo;회원&rdquo;이 등록한 게시물에 대한 권리와 책임은 게시자에게 있으며, &ldquo;올클래식&rdquo;은 게시자의 동의 없이는 이를 사이트 내 게재 이외의 영리 목적으로 사용할 수 없습니다. 단, 비영리적인 경우에는 그러하지 않습니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 사이트 내의 이전 및 게재권을 갖습니다.</li>
                            <li>&ldquo;회원&rdquo;은 &ldquo;서비스&rdquo;를 이용하여 얻은 정보를 가공, 판매하는 등 &ldquo;서비스&rdquo;에 게재된 자료를 상업적으로 사용할 수 없습니다.</li>
                        </ol>
                        <p>제13조 (기본 제공 서비스)</p>
                        <ol>
                            <li>&ldquo;회원&rdquo;은 &ldquo;올클래식&rdquo;이 제공하는 검색서비스, 커뮤니티 이용, VOD 서비스, 게시판 이용이 가능합니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 공연 및 전시 정보를 정기적부정기적으로 수신동의자에 한하여 이메일과 휴대폰 문자서비스(이하 &ldquo;문자&rdquo;라 합니다.)로 제공합니다.</li>
                            <li>&ldquo;올클래식&rdquo;은 부정기적으로 공연 또는 전시에 대한 &ldquo;할인쿠폰&rdquo;을 제공할 수 있습니다.</li>
                            <li>&ldquo;회원&rdquo;은 홈페이지 이벤트 참여기회를 얻습니다. 단, 참여 조건과 참여횟수는 올클래식이 홈페이지에 표시한 기준에 따라 제한될 수 있습니다.</li>
                        </ol>
                        <p>제14조 (관할 법원) 본 &ldquo;서비스&rdquo;와 관련된 분쟁에 대해 소송이 제기될 경우, 올클래식의 본사 소재지를 관할하는 법원을 전속 관할 법원으로 합니다.</p>
                        <p>부 칙 1. 본 약관은 2018년 12월 31일부터 시행합니다.</p>

                    </div>
                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_terms" class="form-group pull-right filedDisplay" Text="<%$Resources:DisplayText,Doyouaccepttermsofuse %>" />
                        <br />
                    </div>
                    <br />

                    <h6 class="contentHeader"><%= Resources.DisplayText.PrivacyPolicy %> </h6>
                    <div style="background-color: white; white; height: 500px; overflow-y: scroll;" class="shadowedPanel filedDisplay">

                        <p>제1조 (올클래식의 기본의무)</p>
                        <ol>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 &ldquo;회원&rdquo; &ldquo;등록&rdquo; 또는 &ldquo;가입&rdquo;시 &ldquo;서비스&rdquo; 제공에 필요한 최소한의 정보를 수집합니다.</li>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 &ldquo;회원&rdquo;이 &ldquo;서비스&rdquo;를 안전하게 이용할 수 있도록 &ldquo;회원&rdquo;의 개인정보(신용정보 포함) 보안에 대하여 최고의 안전 조치를 강구하여 &ldquo;회원&rdquo;의 정보보안에 최선을 다해야 할 의무가 있습니다.</li>
                        </ol>
                        <p>제2조 (개인정보의 수집)</p>
                        <ol>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 다음 각 호의 개인정보를 &ldquo;회원&rdquo;으로부터 수집합니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>성명 (필수항목)</li>
                                    <li>생년월일 (양력/음력 포함, 필수항목)</li>
                                    <li>이메일주소 (필수항목)</li>
                                    <li>아이디 (필수항목)</li>
                                    <li>비밀번호 (암호화되어 관리되며 올클래식은 해당 정보를 활용하지 않습니다, 필수항목)</li>
                                    <li>연락처 (필수항목)</li>
                                    <li>주소 및 배송처 (선택항목)</li>
                                    <li>거래의 위치 (선택항목)</li>
                                    <li>인터넷 프로토콜 주소(IP Address, 자동수집, 필수항목)</li>
                                    <li>법정대리인의 성명(만14세 미만 가입자의 경우)</li>
                                    <li>인증정보 (다음 중 최소 1개 이상 필수) 가. 아이핀인증 결과 (아이핀 아이디포함) 나. 휴대폰번호 인증결과</li>
                                </ol>
                            </li>
                            <li>고객은 제1항의 필수항목을 제공함으로써 &ldquo;회원&rdquo;으로서의 자격을 부여받습니다. 고객은 해당 항목에 대한 제공을 거부할 수 있으며 이 경우 &ldquo;회원&rdquo;으로서의 자격을 부여받을 수 없습니다. 다만, 선택항목에 대해서는 그러하지 않습니다.</li>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 &ldquo;회원&rdquo;의 개인식별이 가능한 정보를 수집하는 때에는 반드시 당해 고객의 동의를 받습니다. (회원가입 약관을 읽고 `동의함`버튼을 누른 후 회원 본인이 직접 신청서를 작성하시면 이 약관에 동의한 것으로 간주합니다.)</li>
                        </ol>
                        <p>&nbsp;제3조 (개인정보의 활용)</p>
                        <ol>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 수집된 개인정보에 대하여 다음 각 호와 같이 활용할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>이메일, 단문서비스(SMS/LMS/MMS), 우편물로 홍보물, 월간정보지, 정보제공, 이벤트당첨결과 등을 전송 (단, 수신동의자에 한합니다)</li>
                                    <li>인구통계학적 정보를 활용한 통계 분석작업</li>
                                    <li>거래를 위한 기본값 활용</li>
                                    <li>예매정보, 수강정보로의 데이터 가공</li>
                                </ol>
                            </li>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 수집된 개인정보에 대하여 별도의 동의를 받지 아니하고서는 제3자에게 제공하지 않습니다. 단, 다음 각 호의 경우에는 동의없이 제공할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>법령에 특별한 규정이 있는 경우(법령에 따라 행정관청 또는 수사기관이 요구해 온 경우라도 무조건 개인정보를 제공하지 않으며, 법령에 규정된 바에 따라 영장 또는 기관장의 직인이 날인된 서면에 의한 경우에만 제공합니다.)</li>
                                    <li>통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우</li>
                                    <li>제휴사를 통한 회원 가입 시 회원 정보를 제공할 수 있습니다.</li>
                                </ol>
                            </li>
                        </ol>
                        <p>제4조 (개인정보의 취급)</p>
                        <ol>
                            <li>기타 개인정보의 관리, 파기, 열람청구, 정정청구, 제3자 제공 및 위탁업체 제공 등에 관련된 제반 사항은 관련 법령 및 &ldquo;올클래식&rdquo;의 개인정보처리방침에 따릅니다.</li>
                            <li>&ldquo;(주)올클래식코리아&rdquo;는 매표 상업의 판매대행사를 지정 운영함에 따라 다음 각 호에 해당하는 &ldquo;회원&rdquo;의 개인정보를 해당 업체에 위탁할 수 있습니다.
                                <ol style="list-style-type: upper-alpha;">
                                    <li>대상자 : &ldquo;홈페이지&rdquo;를 통해 공연전시를 예매한 &ldquo;회원&rdquo;</li>
                                    <li>위탁내용 : 예매 및 결제 진행을 위한 &ldquo;회원&rdquo; 개인정보 부문</li>
                                </ol>
                            </li>
                        </ol>
                        <p>&nbsp;</p>


                    </div>

                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_privacy" class="form-group pull-right filedDisplay" Text="<%$Resources:DisplayText,Doyouacceptprivacypolicy %>" />
                        <br />
                    </div>

                </div>
                <div class="col-md-12 col-xs-12 pull-right" style="text-align: center;">
                    <asp:Button ID="txt_addInstrument" CssClass="btn btn-success contentButton" runat="server" Text="<%$Resources:DisplayText,Continue %>" OnClick="btn_continueclicked" />
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function showSelectMessage() {
            alert("Please agree to the terms and conditions.");
        }
    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }


        ::-webkit-scrollbar {
            width: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #eeeeee;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #d5d5d5;
            }
    </style>

    <script type="text/javascript">
        document.getElementById("signuptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("signuptab").style.borderRight = "none";
    </script>

</asp:Content>
