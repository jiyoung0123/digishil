<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
  $(document).ready( async () => {
    await display();
    chatDetails.init();
    reserveHostGuest.init();
    // 고민해보자. - (1) 서버 문제가 있고 (2) jsp이기 때문에 새로고침되는 문제.
    // setInterval(() => {
    //   display();
    // }, 3000);

      //중요!! 뒤집기
    // setInterval(() => {
    //   flippedBtn();
    // }, 5000);

      $(document).on('click', '.flippedBtn', function(){
          console.log('flipped Btn clicked');
          let flippedDivId = $(this).closest('.d-flex').attr('id');
          let divId = flippedDivId.slice(1);
          console.log(divId);
          let divId2 = "#" + divId;
          console.log(flippedDivId);
          //let originalDivId = flippedDivId.replace("new","");
          let originalDivId = divId2.slice(0,-3);
          console.log(originalDivId);
          $(originalDivId).show();
          $(flippedDivId).hide();
      })

  });





  let chatDetails = {
    init: (() => {
      $(document).on('click', '.detectBtn', function(){
        console.log('clicked');
        let text = $(this).data('chat-contents');
        let divId = "#" + $(this).closest('.d-flex').attr('id');
        console.log(divId);
        $.ajax({
          url: 'chat/detectLanguage',
          data: {
            'text' : text
          }
        }).done(function(data) {
          data = JSON.parse(data);
          if(data.langCode !== undefined && data.langCode !== 'ko') {
            console.log('번역가능. ');
            translate(data.langCode, text, divId);
            $(divId).hide();
            console.log(divId);
          }else{
            console.log('원래 한국어이거나 인식을 못한 경우로 번역할 수 없습니다.');
          }
        }).fail(function() {
          console.log('failed');
        });
      })

      $('#buttonSendMessage').click(() => {
        console.log('clicked');
        if($('#chatContentsBox').val().length == 0){
            alert('뭐라도 내용을 넣으세요');
        }else{
            sendData();
        }
      });
    })
  };

  function translate(sourceLanguage, text, divId){
    $.ajax({
      url : 'chat/translate',
      data : {
        'targetLanguage' : sourceLanguage,
        'text' : text
      }
    }).done((data)=>{
      console.log('succeed to load translation data');
      data = JSON.parse(data);
      console.log("=====번역결과=====");
      let translatedResult = data.message.result.translatedText;
      console.log(data.message.result.translatedText);
      $(divId).hide();
      let newHtml =
              `
                  <div class="d-flex col-md-9 col-xl-7 mb-3" id=\${divId}new>
                  <img class="avatar avatar-border-white flex-shrink-0" src="img/avatar/avatar-1.jpg" alt="user">
                  <div class="ms-3">
                  <div class="bg-200 bg-warning-light rounded p-4 mb-2">
                  <p id="chatContents">\${translatedResult}</p>
                  </div>
                  </div>
                  </div>
              `;
      $(divId).html(newHtml);
    }).fail(()=>{
      console.log('failed');
    })
  }

  function flippedBtn(){

  }



  function sendData() {

    $.ajax({
      url: 'chat/request',
      data: {
        'chatRoomId': $('#chatRoomId').val(),
        'chatSender': $('#chatSender').val(),
          'chatContents': $('#chatContentsBox').val()
      }
    })
            .done((data) => {
              console.log("success");
              // chatDetails.display(data);
              display();
            })
            .fail(() => {
              console.log("failed to load data");
            });
  }

  function display(){
    let chatSender = $('#chatSender').val();
    console.log(chatSender);
    $.ajax({
      url: 'chat/display',
      data: {
        chatRoomId: $('#chatRoomId').val(),
        chatSender: $('#chatSender').val()
      }
    }).done((data)=>{
      console.log('success');
      console.log(data);
      $('#chatContainer').empty();
      //시간 순서대로 나열
      data.sort((a, b) => new Date(a.chatDate) - new Date(b.chatDate));
      data.forEach(obj => {
        //console.log('====');
        //console.log(obj.chatSender);
        if(obj.chatSender == chatSender){
          let html =
                  `
                  <div class="d-flex col-md-9 col-xl-7 ms-lg-auto mb-3" id=\${obj.chatContentsId}>
                  <div class="ms-auto">
                  <div class="bg-primary rounded p-4 mb-2">
                  <p class="text-sm mb-0 text-white" id="chatContents">\${obj.chatContents}</p>
                  </div>
                  <p class="small text-muted ms-3">\${obj.chatDate}</p>
                  </div>
                  <img class="avatar avatar-border-white flex-shrink-0" src="img/avatar/avatar-10.jpg" alt="user">
                  </div>
                  `;
          $('#chatContainer').append(html);
        }else{
          let html =
                  `
                  <div class="d-flex col-md-9 col-xl-7 mb-3" id=\${obj.chatContentsId}>
                  <img class="avatar avatar-border-white flex-shrink-0" src="img/avatar/avatar-1.jpg" alt="user">
                  <div class="ms-3">
                  <div class="bg-gray-200 rounded p-4 mb-2">
                  <p id="chatContents">\${obj.chatContents}</p>
                  </div>
                  <p class="small text-muted ms-3">\${obj.chatDate}<button type="button" class="btn detectBtn" data-chat-contents="\${obj.chatContents}">번역</button></p>
                  </div>
                  </div>
                  `
          $('#chatContainer').append(html);
        }
      })}).fail(()=>{
      console.log('failed');
    })

  }//end of display function







</script>


<body style="padding-top: 72px;">
    <section class="py-5">
      <div class="container">
          <div class="row">
          <div class="col-lg-3 me-lg-auto">
              <div class="card border-0 shadow mb-6 mb-lg-0">
                  <div class="card-header bg-gray-100 py-4 border-0 text-center"><a class="d-inline-block" href="#"><img class="d-block avatar avatar-xxl p-2 mb-2" src="/img/avatar/avatar-10.jpg" alt=""></a>
                      <h5>${hostInfo.hostName}</h5>
                      <p class="text-muted text-sm mb-0">${hostInfo.hostIntro} </p>
                  </div>
                  <div class="card-body p-4">
                      <div class="d-flex align-items-center mb-3">
                          <div class="icon-rounded icon-rounded-sm bg-primary-light flex-shrink-0 me-2">
                              <svg class="svg-icon text-primary svg-icon-md">
                                  <use xlink:href="#diploma-1"> </use>
                              </svg>
                          </div>
                          <div>
                              <p class="mb-0">평점 : ${hostInfo.hostRate}  /  5</p>
                          </div>
                      </div>
                      <div class="d-flex align-items-center mb-3">

                          <div class="icon-rounded icon-rounded-sm bg-primary-light flex-shrink-0 me-2">
                              <svg class="svg-icon text-primary svg-icon-md">
                                  <use xlink:href="#diploma-1"> </use>
                              </svg>
                          </div>
                          <div>
                              <p class="mb-0">${hostInfo.hostLang}가<br> 유창한 호스트</p>
                          </div>
                      </div>
                      <div class="d-flex align-items-center mb-3">

                          <div class="icon-rounded icon-rounded-sm bg-primary-light flex-shrink-0 me-2">
                              <svg class="svg-icon text-primary svg-icon-md">
                                  <use xlink:href="#diploma-1"> </use>
                              </svg>
                          </div>
                          <div>
                              <p class="mb-0">${hostInfo.hostYear}년 동안 호스트</p>
                          </div>
                      </div>
                      <div class="d-flex align-items-center mb-3">

                          <div class="icon-rounded icon-rounded-sm bg-primary-light flex-shrink-0 me-2">
                              <svg class="svg-icon text-primary svg-icon-md">
                                  <use xlink:href="#diploma-1"> </use>
                              </svg>
                          </div>
                          <div>
                              <p class="mb-0">${hostInfo.hostJob}을<br> 주로 하고 있어요</p>
                          </div>
                      </div>
                      <hr>
                      <h6>Jack provided</h6>
                      <ul class="card-text text-muted">
                          <li>Government ID</li>
                          <li>Email address</li>
                          <li>Phone number</li>
                      </ul>
                  </div>
              </div>
          </div>

          <!-- Breadcrumbs -->
      <div class="col-lg-9 ps-lg-5">
          <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center mb-4">
          <h1 class="mb-3 mb-md-0 hero-heading mb-0">${hostInfo.hostName}님과의 대화 </h1>
          <div><a class="btn btn-link ps-0" href="/chat?guestId=${guestId}"><i class="fa fa-arrow-left me-2"></i> 채팅방으로 돌아가기</a></div>
        </div>
          <div id="reserveCardBody">
              <c:choose>
                  <c:when test="${reserveInfo != null}">
                      <div class="card border-0 shadow mb-4">
                          <div class="card-body p-4">
                              <div class="text-block pb-3">
                                  <div class="d-flex align-items-center justify-content-between">
                                      <div>
                                          <h6> <a class="text-reset" href="detail-rooms.html">${reserveInfo[0].roomName}</a></h6>
                                          <p class="text-muted text-sm mb-0">${reserveInfo[0].roomAddress}</p>
                                          <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                          </div>
                                      </div><a href="detail-rooms.html"><img class="ms-3 rounded flex-shrink-0" src="img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="" width="100"></a>
                                  </div>
                              </div>
                              <div class="text-block pt-3 pb-0">
                                  <ul class="list-unstyled text-sm mb-0">
                                      <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>${reserveInfo[0].reserveCap} guests</li>
                                      <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i>${reserveInfo[0].reserveCheckIn} <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i>${reserveInfo[0].reserveCheckOut}</li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                  </c:when>
                  <c:otherwise>

                  </c:otherwise>
              </c:choose>
          </div>
        <!-- (1) JSP로 뿌리는 방식 -->

        <!-- (2) script로 뿌리는 방식 -->
        <div class="px-4 py-5">
          <div class="row" id="chatContainer" style="display:inline">

          </div>
        </div>
        <!-- Typing area-->
        <form class="bg-light rounded shadow-sm" action="#">
          <div class="input-group">
            <input type="hidden" id="chatRoomId" value="${chatRoomId}"/>
            <input type="hidden" id="chatSender" value="${guestId}"/>
            <textarea class="form-control border-0 p-4 bg-light text-sm" id="chatContentsBox" placeholder="Type a message" aria-describedby="button-sendMessage"></textarea>
            <button class="btn btn-link" id="buttonSendMessage" type="button"><i class="fa fa-paper-plane"></i></button>
          </div>
        </form>
      </div>
          </div>
      </div>
    </section>
    <!-- Footer-->
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite -
      //   see more here
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {

          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg');
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');

    </script>
    <!-- jQuery-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js"></script>
  </body>