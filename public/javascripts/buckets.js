function updateBucketTotals(elm) {
	ids = elm.id.split("-");
	account_id =  ids[0];
	paycheck_id = ids[1];
	bucket_id =   ids[2];
	amount = elm.value.replace(/\$|\,/g,'');
	paycheck_total_amount = document.getElementById("paycheck_remaining_original_" + paycheck_id).value;
	
	total_paycheck = getTotalPaycheck(paycheck_id);
	total_bucket = getTotalBucket(account_id, bucket_id);

	updateMonthTotal(account_id, bucket_id, total_bucket);
	updateRemainingPaycheck(account_id, paycheck_id, paycheck_total_amount, total_paycheck);
	updateTotalPaycheck(account_id, paycheck_id, total_paycheck);

	sumMonth(account_id);
	
	elm.className = "modified";
}

function updateCurrentMonthly(account_id) {
	total_month = 0.0;
	elms = document.getElementsByTagName("input");
	for (i=0; i<elms.length; i++) {
		if (elms[i].id.indexOf("current_monthly_" + account_id + "-") != -1) {
			total_month += parseFloat(elms[i].value.replace(/\$|\,/g,''));
		}
	}
	document.getElementById("total_current_monthly_" + account_id).innerHTML = numToCurrency(total_month);
}

function updateMonthTotal(account_id, bucket_id, total_bucket) {
	document.getElementById("monthly_" + account_id + "-" + bucket_id).innerHTML = numToCurrency(total_bucket);
}

function updateRemainingPaycheck(account_id, paycheck_id, paycheck_total_amount, total_paycheck) {
	new_value = numToCurrency(paycheck_total_amount - total_paycheck);
	document.getElementById("paycheck_remaining_" + paycheck_id).innerHTML = new_value;
	if (new_value < 0) {
		document.getElementById("paycheck_remaining_" + paycheck_id).className = "right bold red";
	}
}

function updateTotalPaycheck(account_id, paycheck_id, total_paycheck) {
	document.getElementById("paycheck_total_" + paycheck_id).innerHTML = numToCurrency(total_paycheck);
	if (total_paycheck < 0) {
		document.getElementById("paycheck_total_" + paycheck_id).className = "right bold red";
	}
}

function sumMonth(account_id) {
	total_month = 0.0;
	elms = document.getElementsByTagName("td");
	for (i=0; i<elms.length; i++) {
		if (elms[i].id.indexOf("monthly_" + account_id + "-") != -1) {
			total_month += parseFloat(elms[i].innerHTML.replace(/\$|\,/g,''));
		}
	}
	document.getElementById("total_monthly_" + account_id).innerHTML = numToCurrency(total_month);
}

function getTotalPaycheck(paycheck_id) {
	total_paycheck = 0.0;
	elms = document.getElementsByTagName("input");
	for (i=0; i<elms.length; i++) {
		if (elms[i].name.indexOf(paycheck_id + "-") != -1) {
			total_paycheck += parseFloat(elms[i].value.replace(/\$|\,/g,''));
		}
	}
	return total_paycheck;
}

function getTotalBucket(account_id, bucket_id) {
	total_bucket = 0.0
	var reg = '^' + account_id + '-.{1,}-' + bucket_id + '$';
	elms = document.getElementsByTagName("input");
	for (i=0; i<elms.length; i++) {
		if (elms[i].name.match(reg)) {
				total_bucket += parseFloat(elms[i].value.replace(/\$|\,/g,''));
		}
	}
	return total_bucket;
}