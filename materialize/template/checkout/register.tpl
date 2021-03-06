<div class="row">
	<div class="col s12 l6">
		<div id="account" class="card-panel z-depth-2">
			<h4 class="text-bold"><?php echo $text_your_details; ?></h4>
			<div class="row">
				<div class="input-field col s12">
					<input type="text" name="firstname" value="" id="input-payment-firstname" class="validate">
					<label for="input-payment-firstname" class="active text-medium required"><?php echo $entry_firstname; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="lastname" value="" id="input-payment-lastname" class="validate">
					<label for="input-payment-lastname" class="active text-medium required"><?php echo $entry_lastname; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="email" value="" id="input-payment-email" class="validate">
					<label for="input-payment-email" class="active text-medium required"><?php echo $entry_email; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="telephone" value="" id="input-payment-telephone" class="validate" data-inputmask="'mask':'8 (999) 999-99-99'">
					<label for="input-payment-telephone" class="active text-medium required"><?php echo $entry_telephone; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="fax" value="" placeholder="<?php echo $entry_fax; ?>" id="input-payment-fax" class="validate">
					<label for="input-payment-fax" class="active text-medium"><?php echo $entry_fax; ?></label>
				</div>
			</div>
			<h4 class="text-bold"><?php echo $text_your_password; ?></h4>
			<div class="row">
				<div class="input-field col s12">
					<input type="password" name="password" value="" id="input-payment-password" class="validate">
					<label for="input-payment-password" class="active text-medium required"><?php echo $entry_password; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="password" name="confirm" value="" id="input-payment-confirm" class="validate">
					<label for="input-payment-confirm" class="active text-medium required"><?php echo $entry_confirm; ?></label>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 l6">
		<div id="address" class="card-panel z-depth-2">
			<h4 class="text-bold"><?php echo $text_your_address; ?></h4>
			<div class="row">
				<div class="input-field col s12">
					<input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="validate">
					<label for="input-payment-company"><?php echo $entry_company; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="address_1" value="" id="input-payment-address-1" class="validate">
					<label for="input-payment-address-1" class="text-medium required"><?php echo $entry_address_1; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="address_2" value="" id="input-payment-address-2" class="validate">
					<label for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="city" value="" id="input-payment-city" class="validate">
					<label for="input-payment-city" class="text-medium required"><?php echo $entry_city; ?></label>
				</div>
				<div class="input-field col s12">
					<input type="text" name="postcode" value="" id="input-payment-postcode" class="validate">
					<label for="input-payment-postcode" class="required"><?php echo $entry_postcode; ?></label>
				</div>
				<div class="input-field col s12">
					<select name="country_id" id="input-payment-country">
						<option value="" disabled selected><?php echo $text_select; ?></option>
						<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
					<label for="input-payment-country" class="text-medium required"><?php echo $entry_country; ?></label>
				</div>
				<div class="col s12">
					<label for="input-payment-zone" class="text-medium required"><?php echo $entry_zone; ?></label>
					<select name="zone_id" id="input-payment-zone" class="browser-default">
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12">
		<div class="section">
			<?php echo $captcha; ?>
		</div>
	</div>
	<div class="col s12">
		<div class="section">
			<input type="checkbox" name="newsletter" value="1" id="newsletter" class="filled-in">
			<label for="newsletter"><?php echo $entry_newsletter; ?></label>
		</div>
	</div>
	<?php if ($shipping_required) { ?>
	<div class="col s12">
		<div class="section">
			<input type="checkbox" name="shipping_address" value="1" checked="checked" id="shipping_address" class="filled-in">
			<label for="shipping_address"><?php echo $entry_shipping; ?></label>
		</div>
	</div>
	<?php } ?>
	<div class="col s12">
		<?php if ($text_agree) { ?>
		<input type="checkbox" name="agree" value="1" id="agreement" class="filled-in">
		<label for="agreement"><?php echo $text_agree; ?></label>
		<div class="col s12">
			<div class="section">
				<input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn waves-effect waves-light red right">
			</div>
		</div>
		<?php } else { ?>
		<div class="col s12">
			<div class="section">
				<input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn waves-effect waves-light red right">
			</div>
		</div>
		<?php } ?>
	</div>
</div>
<script>
$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#collapse-payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address select[name=\'country_id\']').trigger('change');

$(":input").inputmask();
$('select').material_select();
</script>