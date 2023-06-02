/**
 * Directory – Directory & Listing Bootstrap Theme v. 2.0.2
 * Homepage: https://themes.getbootstrap.com/product/directory-directory-listing-bootstrap-4-theme/
 * Copyright 2022, Bootstrapious - https://bootstrapious.com
 */

"use strict";


$(function () {
    var singleMonth = false;
    if ($(window).width() < 767) {
        singleMonth = true;
    }

    var dateRangeConfig = {
        autoClose: true,
        startDate: new Date(),
        selectForward: true,
        applyBtnClass: "btn btn-primary",
        container: ".datepicker-container",
        inline: true,
        singleMonth: singleMonth,
        showDateFilter: function (time, date) {
            return (
                '<div style="padding:0 5px;">\
                            <span style="font-weight:bold">' +
                date +
                '</span>\
                            <div class="day-subtitle">₩' +
                roomPrice +
                "</div>\
                        </div>"
            );
        },

        // 예약 날짜 비활성화 함수
        beforeShowDay: function (t) {
            let year = t.getFullYear();
            let month = t.getMonth() + 1;
            let day = t.getDate();

            let isReserved = false;
            if (reservedDates) {
                for (let i = 0; i < reservedDates.length; i++) {
                    let reserveCheckIn = new Date(reservedDates[i].reserveCheckIn);
                    let reserveCheckOut = new Date(reservedDates[i].reserveCheckOut);
                    if (year === reserveCheckIn.getFullYear() && month === reserveCheckIn.getMonth() + 1) {
                        let reserveDay = reserveCheckIn.getDate();
                        if (day >= reserveDay && day <= reserveCheckOut.getDate()) {
                            isReserved = true;
                            break;
                        }
                    }
                }
            }

            if (isReserved) {
                return [false, "", "예약완료"];
            }
            return [true, "", ""];
        },

        customOpenAnimation: function (cb) {
            $(this).fadeIn(300, cb);
        },
        customCloseAnimation: function (cb) {
            $(this).fadeOut(300, cb);
        },
    };


    // 예약내역 확인 함수
    let reservedDates = [];
     function fetchReservedDates() {
            $.ajax({
                url: '/reserved',
                data: { 'id': roomId },
                success: function (result) {
                    reservedDates = result;
                },
            });
        }

        fetchReservedDates(); // 예약된 날짜를 가져옴
    $("#reserveDate")
        .dateRangePicker(dateRangeConfig)
        .bind("datepicker-opened", function () {
            /* This event will be triggered after date range picker open animation */
            //$('.date-picker-wrapper').css('top', 0);
        });
});
