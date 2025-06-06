from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import tempfile
import shutil
import os
import sys
import re
import argparse
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait


#Get all command line arguments
full_cmd_arguments=sys.argv

argument_list= full_cmd_arguments[1:]

parser = argparse.ArgumentParser()
parser.add_argument('--url', help='online boutique url')
args = vars(parser.parse_args())
base_url=args['url']

# 1. Create a unique temporary directory for this Chrome session's user data
temp_user_data_dir = tempfile.mkdtemp()
print(f"Using temporary user data directory: {temp_user_data_dir}")

chrome_options = Options()
# 2. Tell Chrome to use this temporary directory
chrome_options.add_argument(f"--user-data-dir={temp_user_data_dir}")

chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage") # Overcomes limited resource problems in some environments
driver = None

def homepage_validation(driver,step="Step 1:"):
    driver.get(base_url)
    print(step+" - Page title: ",driver.title)
    if "Online Boutique" in driver.title:
        print(step+"PASS")
    else:
        print(step+"FAIL")


def count_hot_products(driver,step="Step 2:"):
    try:
        # Wait for the hot products container to be visible
        WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.CLASS_NAME, "hot-products-row"))
        )
        # Find all elements with the class 'hot-product-card'
        hot_product_cards = driver.find_elements(By.CLASS_NAME, "hot-product-card")
        # Get the total count
        total_products_displayed = len(hot_product_cards)
        print(step, "Retrieved", total_products_displayed, "hot products")
        if total_products_displayed == 9:
            print(step,"PASS")
        else:
            print(step,"FAIL")
    except Exception as e:
        print(step, "FAIL")
        return 0


def sunglasses_product(driver, step="Step 3:"):
    print(step, "Select Sunglasses")
    try:
        sunglasses_link = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "a[href='/product/OLJCESPC7Z']"))
        )
        sunglasses_link.click()
        print(step,"PASS")
    except:
        print(step, "FAIL")


def add_to_cart(driver, step="Step 4:"):
    try:
        add_to_cart_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.XPATH, "//button[contains(., 'Add To Cart')]"))
        )
        add_to_cart_button.click()
        print(step, "Clicked the 'Add To Cart' button by text.")
        print(step, "PASS")
    except Exception as e:
        print(step, "FAIL")

def place_order(driver,step="Step 5:"):
    try:
        # 1. Locate the "Place Order" button using its text (most robust)
        place_order_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.XPATH, "//button[contains(., 'Place Order')]"))
        )
        # 2. Scroll the element
        driver.execute_script("arguments[0].scrollIntoView(true);", place_order_button)
        print(step, "Scrolled 'Place Order' button into view.")
        # 3. Click the button
        place_order_button.click()
        print(step, "Clicked the 'Place Order' button.")
        print(step, "PASS")
    except Exception as e:
        print(step, "FAIL")


def validate_order_details(driver,step="Step 6:"):
    try:
        # 1. Verify the "Your order is complete!" message is present
        WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.XPATH, "//h3[contains(., 'Your order is complete!')]"))
        )
        print(step,"Order confirmation page loaded successfully.")
        # 2. Extract Confirmation #
        confirmation_label = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.XPATH, "//div[contains(., 'Confirmation #')]"))
        )
        # The confirmation number is in the sibling div with class "col-6 pr-md-0 text-right"
        confirmation_number_element = confirmation_label.find_element(By.XPATH, "./following-sibling::div")
        confirmation_number = confirmation_number_element.text.strip()
        print(step, "Confirmation #:",confirmation_number)

        # 3. Extract Tracking # (Optional, but good to get)
        tracking_label = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.XPATH, "//div[contains(., 'Tracking #')]"))
        )
        tracking_number_element = tracking_label.find_element(By.XPATH, "./following-sibling::div")
        tracking_number = tracking_number_element.text.strip()
        print(step, "Tracking #:", tracking_number)
        # 4. Extract Total Paid
        total_paid_label = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.XPATH, "//div[contains(., 'Total Paid')]"))
        )
        total_paid_element = total_paid_label.find_element(By.XPATH, "./following-sibling::div")
        total_paid_amount = total_paid_element.text.strip()
        print(step, "Tracking #:", tracking_number)
        print(step, "Total Paid:", total_paid_amount)
        print(step, "PASS")
        return True
    except Exception as e:
        print(step, "FAIL")
        return False

try:
    # 3. Initialize the WebDriver
    driver = webdriver.Chrome(options=chrome_options)
    homepage_validation( driver,"Step 1:")
    count_hot_products(driver,"Step 2:")
    sunglasses_product(driver,"Step 3:")
    add_to_cart(driver,"Step 4:")
    place_order(driver, "Step 5:")
    order_info = validate_order_details(driver)
    if order_info:
        print("Selenium Test Status: PASS")
    else:
        print("Selenium Test Status: FAIL")
except Exception as e:
    print("Selenium Test Status: FAIL")

finally:
    if driver:
        driver.quit()
    #  Clean tmp directory
    if os.path.exists(temp_user_data_dir):
        shutil.rmtree(temp_user_data_dir)
        print(f"Cleaned up temporary directory: {temp_user_data_dir}")
