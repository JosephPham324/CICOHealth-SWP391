let nav_links = document.querySelectorAll(".converter .nav-link");
let views = document.querySelectorAll(".converter-panel");
let fromUnit;
let toUnit;
let inputAmount;
let outputAmount;
let converterType;

// Turn off all links
function off_links() {
  nav_links.forEach((link) => {
    link.parentElement.classList.remove("active");
  });
}
// Turn off all views
function off_views() {
  views.forEach((view) => {
    // console.log(view)
    view.classList.remove("active");
  });
}
// Add event listeners to all links
nav_links.forEach((link) => {
  link.addEventListener("click", () => {
    off_links(); // Turn off all links
    // Turn on the clicked link
    link.parentElement.classList.add("active");
    let destinationID = link.getAttribute("data-destination");
    let destination = document.querySelector(destinationID);
    // Turn off all views
    off_views();
    switch (destinationID) {
      case "#weight-converter":
        converterType = "weight";
        break;
      case "#length-converter":
        converterType = "length";
        break;
      case "#energy-converter":
        converterType = "energy";
        break;
      default:
        converterType = "weight";
    }
    // Turn on the destination view
    destination.classList.add("active");
    // Set up the converter
    fromUnit = document.querySelector(
      // Get the from unit select element
      `${destinationID} select[name='to-convert']`
    );
    toUnit = document.querySelector(
      // Get the to unit select element
      `${destinationID} select[name='converted']`
    );
    inputAmount = document.querySelector(
      // Get the input amount element
      `${destinationID} input[name='input']`
    );
    outputAmount = document.querySelector(
      // Get the output amount element
      `${destinationID} input[name='result']`
    );
    inputAmount.addEventListener("input", () => {
      // Add event listener to input amount
      calculateFromInput(
        // Calculate the output amount
        converterType,
        inputAmount,
        fromUnit,
        toUnit,
        outputAmount
      );
    });
    // Set the unit labels
    document.querySelector(
      // Set the input unit label
      `${destinationID} .input-field .input-group-text`
    ).innerText = fromUnit.children[fromUnit.selectedIndex].value;
    document.querySelector(
      // Set the output unit label
      `${destinationID} .output-field .input-group-text`
    ).innerText = toUnit.children[toUnit.selectedIndex].value;
    fromUnit.onchange = function () {
      //Upon changing unit, change the unit label
      document.querySelector(
        `${destinationID} .input-field .input-group-text`
      ).innerText = this.children[this.selectedIndex].value;
      // Recalculate the output amount
      calculateFromInput(
        converterType,
        inputAmount,
        fromUnit,
        toUnit,
        outputAmount
      );
    };
    toUnit.onchange = function () {
      //Upon changing unit, change the unit label
      document.querySelector(
        `${destinationID} .output-field .input-group-text`
      ).innerText = this.children[this.selectedIndex].value;
      // Recalculate the output amount
      calculateFromInput(
        converterType,
        inputAmount,
        fromUnit,
        toUnit,
        outputAmount
      );
    };
  });
});
// Calculate the output amount
function calculateFromInput(
  converterType,
  inputElement,
  fromUnitElement,
  toUnitElement,
  outputElement
) {
  // Get the from unit and to unit
  let fromU = fromUnitElement.children[fromUnitElement.selectedIndex].value;
  let toU = toUnitElement.children[toUnitElement.selectedIndex].value;
  let output; // The output amount
  switch (
    converterType // Calculate based on the converter type
  ) {
    case "weight":
      output = WeightConverter.convert(fromU, toU, inputElement.value);
      outputElement.value = Number(output).toFixed(6); // Set the output amount
      break;
    case "length":
      output = LengthConverter.convert(fromU, toU, inputElement.value);
      outputElement.value = Number(output).toFixed(6);
      break;
    case "energy":
      output = EnergyConverter.convert(fromU, toU, inputElement.value);
      outputElement.value = Number(output).toFixed(6);
      break;
    default:
      outputElement.value = WeightConverter.convert(
        fromU,
        toU,
        inputElement.value
      ).toFixed(6);
  }
}

nav_links[0].click();

class WeightConverter {
  // Static variables
  // Store the conversion factors
  static kg_to_g = 1000;
  static g_to_mg = 1000;
  static kg_to_lbs = 2.20462;
  static lbs_to_oz = 16;
  static lbs_to_st = 1 / 14;
  static lbs_to_qtr = 1 / 28;
  static lbs_to_cwt = 1 / 112;

  /**
   * Convert to kg
   * @param {string} fromUnit The unit to convert from
   * @param {number} amount The amount to convert
   * @returns Amount converted to kg
   */
  static toKg(fromUnit, amount) {
    switch (fromUnit) {
      //Metric units
      case "mg":
        return amount / this.g_to_mg / this.kg_to_g;
      case "g":
        return amount / this.kg_to_g;
      case "kg":
        return amount;
      //Imperial units
      case "lbs": //Lbs is the base unit
        return amount / this.kg_to_lbs;
      case "oz":
      case "st":
      case "qtr":
      case "cwt":
        // Convert to lbs first, then to kg
        return this.toKg("lbs", this.toLbs(fromUnit, amount));
      default:
        return -1;
    }
  }

  /**
   * Convert to lbs
   * @param {string} fromUnit Unit to convert from
   * @param {number} amount Amount to convert
   * @returns Amount converted to lbs
   */
  static toLbs(fromUnit, amount) {
    switch (fromUnit) {
      //Metric units
      case "mg":
      case "g":
        // Convert to kg first, then to lbs
        return this.toLbs("kg", this.toKg(fromUnit, amount));
      //kg is the base unit
      case "kg":
        return amount * this.kg_to_lbs;
      //Imperial units
      case "oz":
        return amount / this.lbs_to_oz;
      case "lbs":
        return amount;
      case "st":
        return amount / this.lbs_to_st;
      case "qtr":
        return amount / this.lbs_to_qtr;
      case "cwt":
        return amount / this.lbs_to_cwt;
      default:
        return -1;
    }
  }

  /**
   * Convert from one unit to another
   *
   * @param {string} fromUnit Unit to convert from
   * @param {string} toUnit Unit to convert to
   * @param {number} amount Amount to convert
   * @returns Amount converted to the toUnit
   */
  static convert(fromUnit, toUnit, amount) {
    // Convert to kg first
    let amountKg = this.toKg(fromUnit, amount);
    // Convert to lbs first
    let amountLbs = this.toLbs(fromUnit, amount);
    switch (toUnit) {
      //Metric units
      case "mg":
        return amountKg * this.kg_to_g * this.g_to_mg;
      case "g":
        return amountKg * this.kg_to_g;
      case "kg":
        return amountKg;
      //Imperial units
      case "lbs":
        return amountLbs;
      case "oz":
        return amountLbs * this.lbs_to_oz;
      case "st":
        return amountLbs * this.lbs_to_st;
      case "qtr":
        return amountLbs * this.lbs_to_qtr;
      case "cwt":
        return amountLbs * this.lbs_to_cwt;
    }
  }
}

class LengthConverter {
  // Static variables
  // Store the conversion factors
  static m_to_cm = 100;
  static m_to_dm = 10;
  static m_to_mm = 1000;
  static cm_to_mm = 10;
  static m_to_km = 1 / 1000;
  static ft_to_m = 0.3048;
  static ft_to_in = 12;
  static ft_to_mi = 1 / 5280;
  static ft_to_nmi = 1 / 6076.1;

  /**
   * Convert to meters
   * @param {string} fromUnit Unit to convert from
   * @param {number} amount Amount to convert
   * @returns Amount converted to meters
   */
  static toMeter(fromUnit, amount) {
    switch (fromUnit) {
      //Metric units
      case "mm":
        return amount / this.m_to_mm;
      case "cm":
        return amount / this.m_to_cm;
      case "dm":
        return amount / this.m_to_dm;
      case "m":
        return amount;
      case "km":
        return amount / this.m_to_km;
      //Imperial units
      case "in":
      case "ft":
      case "mi":
      case "nmi":
        // Convert to feet first, then to meters
        return this.toFeet(fromUnit, amount) * this.ft_to_m;
    }
  }
  /**
   * Convert to feet
   * @param {string} fromUnit Unit to convert from
   * @param {number} amount Amount to convert
   * @returns Amount converted to feet
   */
  static toFeet(fromUnit, amount) {
    switch (fromUnit) {
      //Metric units
      case "mm":
      case "cm":
      case "dm":
      case "m":
      case "km":
        // Convert to meters first, then to feet
        return this.toMeter(fromUnit, amount) / this.ft_to_m;
      //Imperial units
      case "in":
        return amount / this.ft_to_in;
      case "ft":
        return amount;
      case "mi":
        return amount / this.ft_to_mi;
      case "nmi":
        return amount / this.ft_to_nmi;
    }
  }
  /**
   * Convert from one unit to another
   *
   * @param {string} fromUnit Unit to convert from
   * @param {string} toUnit Unit to convert to
   * @param {number} amount Amount to convert
   * @returns Amount converted to the toUnit
   */
  static convert(fromUnit, toUnit, amount) {
    let amountM = this.toMeter(fromUnit, amount);
    let amountFt = this.toFeet(fromUnit, amount);
    // console.log(amountM)
    // console.log(amountFt)
    switch (toUnit) {
      case "mm":
        return amountM * this.m_to_mm;
      case "cm":
        return amountM * this.m_to_cm;
      case "dm":
        return amountM * this.m_to_dm;
      case "m":
        return amountM;
      case "km":
        return amountM * this.m_to_km;
      case "in":
        return amountFt * this.ft_to_in;
      case "ft":
        return amountFt;
      case "mi":
        return amountFt * this.ft_to_mi;
      case "nmi":
        return amountFt * this.ft_to_nmi;
    }
  }
}

class EnergyConverter {
  static cal_to_kcal = 1 / 1000;
  static cal_to_j = 4.184;
  static j_to_cal = 0.239;
  static j_to_kj = 1 / 1000;

  /**
   * Convert to kcal
   * @param {string} fromUnit Unit to convert from
   * @param {number} amount Amount to convert
   * @returns Amount converted to kcal
   */
  static toKcal(fromUnit, amount) {
    switch (fromUnit) {
      case "J":
      case "kJ":
        return this.tokJ(fromUnit, amount) / this.cal_to_j;
      case "cal":
        return amount * this.cal_to_kcal;
      case "kcal":
        return amount;
      default:
        return -1;
    }
  }
  /**
   * Convert to kJ
   * @param {string} fromUnit Unit to convert from
   * @param {number} amount Amount to convert
   * @returns Amount converted to kJ
   */
  static tokJ(fromUnit, amount) {
    switch (fromUnit) {
      case "J":
        return amount * this.j_to_kj;
      case "kJ":
        return amount;
      case "cal":
      case "kcal":
        return this.toKcal(fromUnit, amount) * this.cal_to_j;
    }
  }
  /**
   * Convert from one unit to another
   *
   * @param {string} fromUnit Unit to convert from
   * @param {string} toUnit Unit to convert to
   * @param {number} amount Amount to convert
   * @returns Amount converted to the toUnit
   */
  static convert(fromUnit, toUnit, amount) {
    let kcal = this.toKcal(fromUnit, amount);
    let kJ = this.tokJ(fromUnit, amount);
    // console.log(kcal)
    // console.log(kJ)
    switch (toUnit) {
      case "J":
        return kJ * 1000;
      case "kJ":
        return kJ;
      case "cal":
        return kcal * 1000;
      case "kcal":
        return kcal;
    }
  }
}
console.log(WeightConverter.convert("mg", "kg", 1000000));

/**
 * Copy the output amount to the clipboard
 * Adapted from https://www.w3schools.com/howto/howto_js_copy_clipboard.asp
 *
 * @param {element} tooltip The tooltip element
 */
function copiedTooltip(tooltip) {
  // Get the text field
  let copyText = outputAmount;
  // Select the text field
  copyText.select();
  copyText.setSelectionRange(0, 99999);
  // Copy the text inside the text field into system clipboard
  navigator.clipboard.writeText(copyText.value);
  tooltip.innerHTML = "Copied: " + copyText.value;
}

// Reset the tooltip text
function resetTooltip(tooltip) {
  tooltip.innerHTML = "Copy to clipboard";
}
