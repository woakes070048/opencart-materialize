<?php echo $header; ?>
<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "BreadcrumbList",
		"itemListElement": [
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php $i++ ?>
			<?php if ($i < count($breadcrumbs)) { ?>
			<?php if ($i == 1) {?>
			<?php } else {?>
			{
				"@type": "ListItem",
				"position": <?php echo ($i-1); ?>,
				"item": {
					"@id": "<?php echo $breadcrumb['href']; ?>",
					"name": "<?php echo $breadcrumb['text']; ?>"
				}
			},
			<?php }?>
			<?php } else { ?>
			{
				"@type": "ListItem",
				"position": <?php echo ($i-1); ?>,
				"item": {
					"@id": "<?php echo $breadcrumb['href']; ?>",
					"name": "<?php echo $breadcrumb['text']; ?>"
				}
			}
			<?php }}?>
		]
	}
</script>
	<main>
		<div class="row">
			<div class="container">
				<nav class="breadcrumb-wrapper transparent z-depth-0">
					<div class="nav-wrapper">
						<div class="row">
							<div class="col s12">
							<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
							<?php $i++ ?>
							<?php if ($i < count($breadcrumbs)) { ?>
							<?php if ($i == 1) {?>
								<a href="<?php echo $breadcrumb['href']; ?>" class="breadcrumb black-text"><i class="material-icons">home</i></a>
							<?php } else {?>
								<a href="<?php echo $breadcrumb['href']; ?>" class="breadcrumb black-text"><?php echo $breadcrumb['text']; ?></a>
							<?php }?>
							<?php } else { ?>
								<span class="breadcrumb black-text"><?php echo $breadcrumb['text']; ?></span>
							<?php }}?>
							</div>
						</div>
					</div>
				</nav>
				<div class="row">
					<h1 class="col s12"><?php echo $heading_title; ?></h1>
					<?php if ($column_left && $column_right) { ?>
						<?php $main = 's12 l6'; $goods = 's12'; ?>
					<?php } elseif ($column_left || $column_right) { ?>
						<?php $main = 's12 l9'; $goods = 's12 m6'; ?>
					<?php } else { ?>
						<?php $main = 's12'; $goods = 's12 m6 l4'; ?>
					<?php } ?>
					<?php echo $column_left; ?>
					<?php if ($products) { ?>
					<div class="col <?php echo $main; ?> section href-underline">
						<?php echo $content_top; ?>
						<ul class="collapsible" data-collapsible="expandable">
							<li>
								<div class="collapsible-header bold"><?php echo $text_sort_short; ?><i class="material-icons right">arrow_drop_down</i></div>
								<div class="collapsible-body white">
									<div class="row">
										<div class="col s6 m6 input-field inline">
											<select id="input-sort" onchange="location = this.value;">
												<?php foreach ($sorts as $sorts) { ?>
												<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
												<option value="<?php echo $sorts['href']; ?>" selected><?php echo $sorts['text']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
											<label class="bold" for="input-sort"><?php echo $text_sort; ?></label>
										</div>
										<div class="col s6 m6 input-field inline">
											<select id="input-limit" onchange="location = this.value;">
												<?php foreach ($limits as $limits) { ?>
												<?php if ($limits['value'] == $limit) { ?>
												<option value="<?php echo $limits['href']; ?>" selected><?php echo $limits['text']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
											<label class="bold"><?php echo $text_limit; ?></label>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<div class="row">
							<?php foreach ($products as $product) { ?>
							<div class="col <?php echo $goods; ?>">
								<div class="card sticky-action large z-depth-3 hoverable">
									<?php if ($product['special']) { ?><span class="white-text badge red lighten-1 percent"><?php echo $text_percent; ?> <?php echo $product['percent_discount']; ?>%</span><?php } ?>
									<div class="card-image">
										<span><i class="material-icons small right activator">more_vert</i></span>
										<a href="<?php echo $product['href']; ?>"><img class="lazyload" src="<?php echo $img_loader; ?>" data-src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"></a>
									</div>
									<div class="card-content center-align">
										<span class="card-title"><a href="<?php echo $product['href']; ?>" class="grey-text text-darken-4"><?php echo $product['name']; ?></a></span>
									</div>
									<div class="card-action center-align grey lighten-5">
										<button class="btn btn-floating btn-large waves-effect waves-light red add-cart" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">add_shopping_cart</i></button>
										<?php if ($product['price']) { ?>
											<?php if (!$product['special']) { ?>
												<span class="card-price"><?php echo $product['price']; ?></span>
											<?php } else { ?>
												<span class="card-price old-price grey-text"><?php echo $product['price']; ?></span>
												<span class="card-price red-text text-darken-2"><?php echo $product['special']; ?></span>
											<?php } ?>
											<?php if ($product['tax']) { ?>
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>
										<?php } ?>
										<div class="rating">
											<hr>
											<span class="grey lighten-5">
												<?php if ($product['rating']): { ?>
													<?php for ($i = 1; $i <= 5; $i++) { ?>
														<?php if ($product['rating'] < $i) { ?>
															<i class="material-icons">star_border</i>
														<?php } else { ?>
															<i class="material-icons">star</i>
														<?php } ?>
													<?php } ?>
												<?php } ?>
												<?php else: ?>
													<i class="material-icons">star_border</i>
													<i class="material-icons">star_border</i>
													<i class="material-icons">star_border</i>
													<i class="material-icons">star_border</i>
													<i class="material-icons">star_border</i>
												<?php endif ?>
											</span>
										</div>
										<a href="<?php echo $product['href']; ?>" class="btn waves-effect waves-light red"><?php echo $text_more_detailed; ?></a>
									</div>
									<div class="card-reveal">
										<span class="card-title"><a href="<?php echo $product['href']; ?>" class="grey-text text-darken-4"><?php echo $product['name']; ?></a><i class="material-icons">close</i></span>
										<p><?php echo $product['description']; ?></p>
									</div>
								</div>
							</div>
							<?php } ?>
						</div>
						<div class="row">
							<?php echo $pagination; ?>
						</div>
						<?php if (isset($description)) { ?>
						<div class="card-panel z-depth-1">
							<div class="row valign-wrapper section">
								<div class="col s4 m2 center">
								<?php if ($thumb) { ?>
									<img src="<?php echo $img_loader; ?>" data-src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="responsive-img lazyload">
								<?php } ?>
								</div>
								<div class="col s8 m10">
									<?php if (isset($description)) { ?>
										<?php echo $description; ?>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php } ?>
						<?php echo $content_bottom; ?>
					</div>
					<?php } ?>
				</div>
				<?php echo $column_right; ?>
			</div>
		</div>
	</main>
<?php echo $footer; ?>