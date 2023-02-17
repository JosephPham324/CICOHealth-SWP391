<div class="form-group row">
    <label for="numHeight" class="col-4 col-form-label">Age</label>
    <div class="col-8">
        <input
            value="20"
            id="numAge"
            name="numAge"
            placeholder="Enter your age"
            type="number"
            class="form-control"
            />
    </div>
</div>
<div class="form-group row">
    <label class="col-4">Gender</label>
    <div class="col-8">
        <div class="custom-control custom-radio custom-control-inline">
            <input
                checked=""
                name="radGender"
                id="radGender_0"
                type="radio"
                class="custom-control-input"
                value="male"
                />
            <label for="radGender_0" class="custom-control-label">Male</label>
        </div>
        <div class="custom-control custom-radio custom-control-inline">
            <input
                name="radGender"
                id="radGender_1"
                type="radio"
                class="custom-control-input"
                value="female"
                />
            <label for="radGender_1" class="custom-control-label">Female</label>
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="numHeight" class="col-4 col-form-label">Height (cm)</label>
    <div class="col-8">
        <input
            value="170"
            id="numHeight"
            name="numHeight"
            placeholder="Enter your height"
            min="10"
            type="number"
            class="form-control"
            />
    </div>
</div>
<div class="form-group row">
    <label for="numWeight" class="col-4 col-form-label">Weight (kg)</label>
    <div class="col-8">
        <input
            value="60.0"
            id="numWeight"
            name="numWeight"
            placeholder="Enter your weight"
            min="0.1"
            type="number"
            class="form-control"
            />
    </div>
</div>
<div class="form-group row">
    <label for="selectActiveness" class="col-4 col-form-label"
           >Activeness</label
    >
    <div class="col-8">
        <select
            id="selectActiveness"
            name="selectActiveness"
            class="custom-select"
            aria-describedby="selectActivenessHelpBlock"
            required="required"
            >
            <option value="0">Sedentary - not active</option>
            <option value="1">Lightly active</option>
            <option value="2">Moderately active</option>
            <option value="3">Active</option>
            <option value="4">Extremely active</option>
        </select>
        <span id="selectActivenessHelpBlock" class="form-text text-muted"
              >Estimate how much activity you perform during a day</span
        >
    </div>
</div>
<div class="form-group row">
    <label for="text" class="col-4 col-form-label">TDEE (kcal)</label>
    <div class="col-8">
        <input
            readonly="readonly"
            id="numTDEE"
            name="numTDEE"
            placeholder="0"
            type="number"
            class="form-control"
            aria-describedby="textHelpBlock"
            />
        <span id="textHelpBlock" class="form-text text-muted"
              >Total Daily Energy Expenditure - How much energy you burn in a
            day</span
        >
    </div>
</div>
<div class="form-group row">
    <label for="numProtein" class="col-4 col-form-label">Protein (g)</label>
    <div class="col-8">
        <input
            readonly="readonly"
            id="numProtein"
            name="numProtein"
            placeholder="0"
            type="number"
            class="form-control"
            aria-describedby="numProteinHelpBlock"
            />
        <span id="numProteinHelpBlock" class="form-text text-muted"
              >How much protein you will need to eat</span
        >
    </div>
</div>
<div class="form-group row">
    <label for="numFat" class="col-4 col-form-label">Fat (g)</label>
    <div class="col-8">
        <input
            readonly="readonly"
            id="numFat"
            name="numFat"
            placeholder="0"
            type="number"
            class="form-control"
            aria-describedby="numFatHelpBlock"
            />
        <span id="numFatHelpBlock" class="form-text text-muted"
              >How much fat you will need to eat</span
        >
    </div>
</div>
<div class="form-group row">
    <label for="numCarb" class="col-4 col-form-label">Carb (g)</label>
    <div class="col-8">
        <input
            readonly="readonly"
            id="numCarb"
            name="numCarb"
            placeholder="0"
            type="number"
            class="form-control"
            aria-describedby="numCarbHelpBlock"
            />
        <span id="numCarbHelpBlock" class="form-text text-muted">How much carbohydrate you will need to eat</span>
    </div>
</div>